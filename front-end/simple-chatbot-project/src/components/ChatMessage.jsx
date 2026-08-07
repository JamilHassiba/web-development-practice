import loadingGif from "../assets/loading-spinner.gif";
import robotImage from "../assets/robot.png";
import userImage from "../assets/user.png";

function ChatMessage({ sender, type, message, time }) {
	return (
		<div className="chat-message-container" sender={sender}>
			{sender === "robot" && <img src={robotImage} alt="" />}
			{type === "text" && (
				<div className="text-container">
					<div className="message">{message}</div>
					<div className="time">{time}</div>
				</div>
			)}
			{type === "loading" && (
				<img className="loading-spinner" src={loadingGif} alt="Loading..." />
			)}
			{sender === "user" && <img src={userImage} alt="" />}
		</div>
	);
}

export default ChatMessage;
