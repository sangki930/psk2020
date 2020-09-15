import React, { useState } from 'react';
import { Link } from 'react-router-dom';

import './Join.css';

const Join = () =>{
    const [name,setName] = useState('');
    //유저 상태
    const [room,setRoom] = useState('');
    //채팅방 상태

return (
    // <h1>Join</h1>
    <div className="joinOuterContainer">
        <div className="joinInnerContainer">
            <h1 className="heading">Join</h1>
            <div><input placeholder="Name" className="joinInput" onChange={(event)=>setName(event.target.value)} /></div>
            <div><input placeholder="Room" className="joinInput mt-20" onChange={(event)=>setRoom(event.target.value)} /></div>
            <Link onClick={event=>(!name || !room)?event.preventDefault():null}to={`/chat?name=${name}&room=${room}`}>
                <button className={"button mt-20"} type="submit">로그인</button>
            </Link>
        </div>
    </div>
    )
}

export default Join;