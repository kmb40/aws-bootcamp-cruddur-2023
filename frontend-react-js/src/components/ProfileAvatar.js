import './ProfileAvatar.css';
//import React from "react";

export default function ProfileAvatar(props) {
  //const backgroundImage = `url("https://assets.cruddur.net/avatars/b3bab483-2e3a-45b4-a702-55357d8a00a0.jpg")`;
  const backgroundImage = `url("https://assets.cruddur.net/avatars/${props.id}.jpg")`;
  const styles = {
    backgroundImage: backgroundImage,
    backgroundSize: 'cover',
    backgroundPosition: 'center',
  };
  return <div className="profile-avatar" style={styles}></div>;
}