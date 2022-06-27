"use strict" //자바스크립트의 오류를 최대한 줄인다

//클라이언트의 socket.io가 담기게 됨 
const socket = io();
//console.log(socket); //socket 객체 
const nickname = document.querySelector("#nickname");
const chatList = document.querySelector(".chatting-list");
const chatInput = document.querySelector(".chatting-input");
const sendButton = document.querySelector(".send-button");
const displayContainer = document.querySelector(".display-container");

sendButton.addEventListener('click', ()=>{
    //전송할 내용 객체
    const param = {
        name : nickname.value,
        msg : chatInput.value        
    }
    //emit(채널아이디, 문자열)
    //클라이언트에게 param 전달 
    socket.emit("chatting", param);
})

//소켓을 이용하여 클라이언트로부터 데이터를 받고 콘솔에 출력
socket.on("chatting", (data)=>{
    //console.log(data)

    //클라이언트로부터 받은 메시지를 객체화해서  

    /*
    //이렇게 하면 css 깨진 메시지가 가게 됩니다...
    const li = document.createElement("li"); //템플릿 문법
    li.innerText = `${data.name}님이 - ${data.msg}`;
    chatList.appendChild(li);
    */

    //destructive - 구조분해 할당 
    const {name, msg, time} = data; // 데이터를 쪼개버린다.

    //인스턴스화 
    const spreadMsg = new chatInstance(name, msg, time);

    spreadMsg.makeLi();

    displayContainer.scrollTo(0, displayContainer.scrollHeight)
});

function chatInstance(name, msg, time){
    this.name = name;
    this.msg = msg;
    this.time = time;

    this.makeLi = ()=>{ 
        const li = document.createElement('li');//li 태그를 만든다.
        //classList.add() → 명시된 클래스 추가
        li.classList.add(nickname.value === this.name ? "sent":"received");

        //ES6 문법
        const dom =  `<span class="profile">
            <span class="user">${this.name}</span>
            <img src="https://placeimg.com/200/50/any" alt="any">
        </span>
        <span class="message">${this.msg}</span>
        <span class="time">${this.time}</span>`
        //위에서 만든 li태그에 dom속성을 넣겠다. 
        li.innerHTML = dom;
        //li라는 노드객체를 채팅 메시지에 넣는다.
        chatList.appendChild(li);
        
    }
}

