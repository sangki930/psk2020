const express = require('express');//Express.js를 부름
const app = express();
const server = require('http').Server(app);
const io = require('socket.io')(server)
const { v4: uuidv4} = require('uuid');//uuid 라이브러리 import
// const { Socket } = require('dgram');
const fs = require('fs');
const {ExpressPeerServer} = require('peer');
const peerServer = ExpressPeerServer(server,{
    debug: true
});//peerJS 사용
app.set('view engine','ejs');
//ejs파일을 view engine으로써 렌더링
app.use(express.static('public'));
app.use('/peerjs',peerServer);
app.get('/',(req,res)=>{
    // res.status(200).send("Hello World");
    // res.render('room');//room.ejs를 렌더링
    res.redirect(`/${uuidv4()}`);
});

app.get('/:room',(req,res)=>{//방 ID를 만들 수 있도록함
    res.render('room',{ roomId : req.params.room});
});

io.on('connection',socket=>{
    socket.on('join-room',(roomId,userId)=>{
        socket.join(roomId);
        socket.to(roomId).broadcast.emit('user-connected', userId);
        // socket.on('disconnect',()=>{
        //     socket.to(roomId).broadcast.emit('user-disconnected', userId);
        // });
        socket.on('message',message=>{
            console.log(`${userId} :`+message);
            io.to(roomId).emit('createMessage',`${userId} :`+message)
        })
        socket.on('disconnect',()=>{
            socket.to(roomId).broadcast.emit('user-disconnected',userId)
        })
    });
});

server.listen(process.env.PORT||3032);//리스닝할 포트번호
//npm install -g nodemon : g는 글로벌하게 설치
