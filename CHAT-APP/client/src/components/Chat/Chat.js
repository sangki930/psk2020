import React, { useState, useEffect} from 'react';
import queryString from 'query-string';
import io from 'socket.io-client';

import './Chat.css';

import InfoBar from '../InfoBar/InfoBar';
import Input from '../Input/Input';
import Messages from '../Messages/Messages';
import TextContainer from '../TextContainer/TextContainer';
let socket;


const Chat = ({location}) =>{
    const [name,setName] = useState('');
    //유저 상태
    const [room,setRoom] = useState('');
    //채팅방 상태
    const [users, setUsers] = useState('');
    const [message,setMessage] = useState('');
    const [messages,setMessages] = useState([]);

    const ENDPOINT = 'localhost:5000';
    useEffect(()=>{//useEffect Hook
        const {name,room} = queryString.parse(location.search);
        //현재 요청값까지 파싱(파라미터 제외)
        console.log(name,room);
        socket=io(ENDPOINT);
        // console.log(location.search);
        // console.log(data);
        setName(name);
        setRoom(room);

        socket.emit('join',{name,room},()=>{
            //방 입장(join)시 이벤트 처리
            // alert(error);
        });
        return ()=>{
            socket.emit('disconnect');
            socket.off();
        }
    },[ENDPOINT, location.search]);

useEffect(()=>{
    socket.on('message',(message)=>{
        setMessages([...messages,message]);
    });

    socket.on("roomData", ({ users }) => {
        setUsers(users);
      });
}, []);
// },[message]);

// 메시지 전송 함수
const sendMessage = (event)=>{
    event.preventDefault();

    if(message){
        socket.emit('sendMessage',message,()=>setMessage(''));
    }
}

console.log(message,messages);

return (
    // <h1>Chat</h1>
    <div className="outerContainer">
        <div className="container">
            <InfoBar room={room}/>
            {/* <input value={message} onChange={(event)=>setMessage(event.target.value)} 
            onKeyPress={event=>event.key==='Enter'?sendMessage(event):null} />  */}
            <Messages messages={messages} name={name} />
            <Input message={message} setMessage={setMessage} sendMessage={sendMessage} />
        </div>
        <TextContainer users={users} />
    </div>
    )//null은 아무것도 안하는 것
}

export default Chat;