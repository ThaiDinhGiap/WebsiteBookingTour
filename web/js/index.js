var data = {
    chatinit: {
        title: ["Hello <span class='emoji'> &#128075;</span>", "I am Traveland's Chatbot", "How can I help you with your travel plans?"],
        options: ["Destinations <span class='emoji'> &#127957;</span>", "Packages <span class='emoji'> &#127958;</span>", "Contact Support Team <span class='emoji'> &#128222;</span>"]
    },
    contact: {
        title: ["Contact Support Team"],
        options: []
    }
};

document.getElementById("init").addEventListener("click", showChatBot);
var cbot = document.getElementById("chat-box");
var len1 = data.chatinit.title.length;

function showChatBot() {
    var chatbox = document.getElementById('chatbox');
    if (chatbox.style.display === 'none' || chatbox.style.display === '') {
        chatbox.style.display = 'block';
        document.getElementById('init').innerText = 'CLOSE CHAT';
        initChat();
    } else {
        chatbox.style.display = 'none';
        document.getElementById('init').innerText = 'START CHAT';
    }
}

function initChat() {
    cbot.innerHTML = '';
    for (let i = 0; i < len1; i++) {
        setTimeout(() => {
            handleChat(i);
        }, i * 500);
    }
    setTimeout(() => {
        showOptions(data.chatinit.options);
    }, (len1 + 1) * 500);
}

function handleChat(index) {
    var elm = document.createElement("p");
    elm.innerHTML = data.chatinit.title[index];
    elm.setAttribute("class", "msg");
    cbot.appendChild(elm);
    handleScroll();
}

function showOptions(options) {
    options.forEach(option => {
        var opt = document.createElement("span");
        opt.innerHTML = `<div>${option}</div>`;
        opt.setAttribute("class", "opt");
        opt.addEventListener("click", handleOpt);
        cbot.appendChild(opt);
        handleScroll();
    });
}

function handleOpt() {
    var str = this.innerText;
    var textArr = str.split(" ");
    var findText = textArr[0].toLowerCase();

    document.querySelectorAll(".opt").forEach(el => el.remove());

    var elm = document.createElement("p");
    elm.setAttribute("class", "test");
    elm.innerHTML = `<span class="rep">${this.innerText}</span>`;
    cbot.appendChild(elm);

    if (findText === 'contact') {
        fetch('ChatBotController', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({category: 'contact'})
        })
        .then(response => response.json())
        .then(detailData => {
            handleAdminResults(detailData.title, detailData.admins);
        })
        .catch(error => console.error('Error fetching contact data:', error));
    } else {
        fetch('ChatBotController', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({category: findText})
        })
        .then(response => response.json())
        .then(detailData => {
            handleResults(detailData.title, detailData.options);
        })
        .catch(error => console.error('Error fetching detail data:', error));
    }
}

function handleDelay(title) {
    var elm = document.createElement("p");
    elm.innerHTML = title;
    elm.setAttribute("class", "msg");
    cbot.appendChild(elm);
}

function handleResults(title, options) {
    title.forEach((t, index) => {
        setTimeout(() => {
            handleDelay(t);
        }, index * 500);
    });

    setTimeout(() => {
        showOptions(options);
    }, title.length * 500);
}

function handleAdminResults(title, admins) {
    handleDelay(title[0]);
    admins.forEach((admin, index) => {
        setTimeout(() => {
            handleDelay(`Name: ${admin.name}<br>Email: ${admin.email}<br>Phone: ${admin.phone}`);
        }, index * 500);
    });
}

function handleScroll() {
    var elem = document.getElementById('chat-box');
    elem.scrollTop = elem.scrollHeight;
}
