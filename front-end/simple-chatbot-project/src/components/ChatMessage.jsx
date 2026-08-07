import loadingGif from "../assets/loading-spinner.gif";
import robotImage from "../assets/robot.png";
import userImage from "../assets/user.png";

function ChatMessage({ sender, type, message }) {
	return (
		<div className="chat-message-container" sender={sender}>
			{sender === "robot" && <img src={robotImage} alt="" />}
			{type === "text" && <div>{message}</div>}
			{type === "loading" && (
				<img className="loading-spinner" src={loadingGif} alt="Loading..." />
			)}
			{sender === "user" && <img src={userImage} alt="" />}
		</div>
	);
}

export default ChatMessage;
