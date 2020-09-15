import React from 'react';

import './Input.css';

//입력 컴포넌트
const Input = ({message,setMessage,sendMessage})=>(
    <form className="form">
        <input 
            className="input"
            type="text"
            placeholder="입력하세요..."
            value={message}
            onChange={(event)=>setMessage(event.target.value)}
            onKeyPress={event=>event.key==='Enter'?sendMessage(event):null}
        />
        <button className="sendButton" onClick={(event)=>sendMessage(event)}>보내기</button>
    </form>
)

export default Input;