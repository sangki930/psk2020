// const Peer = require("peerjs");

// const { PeerServer } = require("peer");
const socket = io('/');
const videoGrid = document.getElementById('video-grid');
// console.log(videoGrid);
const myVideo = document.createElement('video');
myVideo.muted = true;
const peers = {}
// var peer = new Peer(undefined,{
//     path : '/peerjs',
//     host : '/',
//     port : '3030'
//     // port : '443'
// });
const peer = new Peer();
var uid,connectuid;//현재 유저 아이디
let myVideoStream;
navigator.mediaDevices.getUserMedia({
    video: true,
    audio: true
}).then(stream=>{
    myVideoStream = stream;
    addVideoStream(myVideo, stream);
    
    peer.on('call', call => {
        let i =call.answer(stream)?1:0
        console.log("answer 성공 : "+i);
        const video = document.createElement('video')
        call.on('stream', userVideoStream => {
          addVideoStream(video, userVideoStream)
          console.log('비디오 생성');
          
        })
        // , (err) => {
        //     console.error('Failed to get local stream', err);
        //   })

      })
    
      socket.on('user-connected', userId => {
        connectToNewUser(userId, stream)
        console.log(peers);
      })

      let text = $('input')
console.log(text);

$('html').keydown((e)=>{
    if (e.which == 13 && text.val().length !== 0) {
        // console.log(text.val());
        socket.emit('message', text.val());
        text.val('')
      }
})

// $(document).ready(
//   ()=>{
   
//   }
// );

socket.on('createMessage',message=>{//채팅 입력시
    console.log("Create message",message);
    // $(".messages").append(`<li class="message"><b>user</b><br/>${message}</li>`);
    uid = message.substring(0,message.indexOf(":")).trim();
    message = message.substring(message.indexOf(":")+1).trim();
    if(uid===connectuid){
      $(".messages").append(`<li class="message"><b style="color:purple">${uid}</b><br/>${message}</li>`);
    }else
    $(".messages").append(`<li class="message"><b style="color:skyblue">${uid}</b><br/>${message}</li>`);
    scrollToBottom();
})

});

peer.on('open',id=>{
    //connection을 open하면
    //id : 다른 사용자가 접속할 본인의 id
     socket.emit('join-room',ROOM_ID,id);
     console.log("id : "+id);
     
     connectuid=id;
     $("#main__header").append('<h6>Chat</h6>UserID :'+connectuid);
});

const connectToNewUser=(userId,stream)=>{
    //  console.log('new user');
     console.log('커넥트 유저 :'+userId);
    //  console.log("스트림 : "+stream);
     const call = peer.call(userId,stream)
     const video = document.createElement('video')
     call.on('stream', userVideoStream => {
      addVideoStream(video, userVideoStream)
    })
    
    call.on('close', () => {
      console.log('동작?');
      video.remove()
      
    },err=>{
      console.log("에러:"+err);
    })
    peers[userId] = call
  
    // console.log('is it?');
}

socket.on('user-disconnected',userId=>{
  console.log(userId);
  
  console.log(peers[userId]?1:0);
  if(peers[userId]) peers[userId].close()
})

const addVideoStream = (video, stream)=>{
    video.srcObject = stream;
    video.addEventListener('loadedmetadata', () => {
        video.play()
        //윈도우에 있는 카메라 및 오디오 정보를 불러와 영상 실행
        console.log('부름에 응답');
    });
    videoGrid.append(video);
    
}

const scrollToBottom = () => {
    let d = $('.main__chat_window');
    d.scrollTop(d.prop("scrollHeight"));
  }

  //음소거,켬
const muteUnmute = () => {
    console.log(myVideoStream);
    const enabled = myVideoStream.getAudioTracks()[0].enabled;
    if (enabled) {
      myVideoStream.getAudioTracks()[0].enabled = false;
      setUnmuteButton();
    } else {
      setMuteButton();
      myVideoStream.getAudioTracks()[0].enabled = true;
    }
  }
//영상 끔,켬
  const playStop = () => {
    
    let enabled = myVideoStream.getVideoTracks()[0].enabled;
    if (enabled) {
      myVideoStream.getVideoTracks()[0].enabled = false;
      setPlayVideo()
    } else {
      setStopVideo()
      myVideoStream.getVideoTracks()[0].enabled = true;
    }
  }
  //아래 4개는 영상 켬/끔, 음성 켬/끔을 나타내는 이벤트 코드
  const setMuteButton = () => {
    const html = `
      <i class="fas fa-microphone"></i>
      <span>Mute</span>
    `
    document.querySelector('.main__mute_button').innerHTML = html;
  }
  
  const setUnmuteButton = () => {
    const html = `
      <i class="unmute fas fa-microphone-slash"></i>
      <span>Unmute</span>
    `
    document.querySelector('.main__mute_button').innerHTML = html;
  }
  
  const setStopVideo = () => {
    const html = `
      <i class="fas fa-video"></i>
      <span>Stop Video</span>
    `
    document.querySelector('.main__video_button').innerHTML = html;
  }
  
  const setPlayVideo = () => {
    const html = `
    <i class="stop fas fa-video-slash"></i>
      <span>Play Video</span>
    `
    document.querySelector('.main__video_button').innerHTML = html;
  }