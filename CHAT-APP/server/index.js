const express = require('express');
//Express.js 활용
const socketio = require('socket.io');
//Socket.io 라이브러리 부르기
const http = require('http');
//http 사용
// const cors = require('cors');

const {addUser,removeUser,getUser,getUsersInRoom} = require('./users.js');

const PORT = process.env.PORT || 5000
//기본 포트 또는 5000

const router = require('./router');
// const { getUsersInRoom } = require('./users');

const app = express();
const server = http.createServer(app);
const io = socketio(server);

// app.use(cors());
app.use(router);

io.on('connection',(socket)=>{//소켓 io 접속
    console.log('새 접속 확인');

    //채팅방 입장 시
    socket.on('join',({name,room},callback)=>{
        const {error,user} = addUser({id:socket.id,name,room});

        if(error)return callback(error);

        // const error=true;

        // if(error){
        //     callback({error:error});
        // }
        //유저가 방에 들어올 때, 전체에게 메시지를 보냄
        socket.join(user.room);

        socket.emit('message',{user:'관리자',text:`${user.name}, ${user.room}에 입장을 환영합니다`});
        socket.broadcast.to(user.room).emit('message', { user: 'admin', text: `${user.name}님이 들어왔습니다` });
        

        io.to(user.room).emit('roomData',{room: user.room,users: getUsersInRoom(user.room)});
        

        callback();
    });

    socket.on('sendMessage',(message,callback)=>{
        const user = getUser(socket.id);

        io.to(user.room).emit('message',{user: user.name, text: message});
        io.to(user.room).emit('roomData',{room: user.room,users: getUsersInRoom(user.room)});
        callback();
    });

    socket.on('disconnect',()=>{
        const user = removeUser(socket.id);

        if(user){
            io.to(user.room).emit('message',{user:'관리자',text:`${user.name}님이 나갔습니다`})
        }
    })
});

// app.use(router);

server.listen(PORT,()=>console.log(`포트 ${PORT}에서 서버 실행`));