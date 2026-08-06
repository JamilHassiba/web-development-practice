import robotImage from "../assets/robot.png";
import userImage from "../assets/user.png";

function ChatMessage({ sender, message }) {
	return (
		<div className="chat-message-container" sender={sender}>
			{sender === "robot" && <img src={robotImage} alt="" />}
			<div>{message}</div>
			{sender === "user" && <img src={userImage} alt="" />}
		</div>
	);
}

export default ChatMessage;
