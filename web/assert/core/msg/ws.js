WS = function (fromUid, channel, callback) {
    this.fromUid = fromUid;
    this.channel = channel;
    this.callback = callback;
};
WS.prototype.init = function () {


    var host = window.location.host;
    var websocket;
    if ('WebSocket' in window) {
        websocket = new ReconnectingWebSocket("ws://"
            + host + ":8080/ws/chat/" + this.fromUid + "/" + this.channel + "/", null, {
            debug: true,
            maxReconnectAttempts: 4
        });
    } else if ('MozWebSocket' in window) {
        websocket = new MozWebSocket("ws://" + host
            + ":8080/ws/chat/" + this.fromUid + "/" + this.channel + "/");
    } else {
        websocket = new SockJS("http://" + host
            + ":8080/sockjs/ws/chat/" + this.fromUid + "/" + this.channel + "/");
    }


    websocket.onopen = function (evnt) {
        console.log("websocket连接上");
    };
    websocket.onmessage = function (evnt) {
        this.callback(evnt)
        //messageHandler(evnt.data);
    };
    websocket.onerror = function (evnt) {
        console.log("websocket错误");
    };
    websocket.onclose = function (evnt) {
        console.log("websocket关闭");
    }
};