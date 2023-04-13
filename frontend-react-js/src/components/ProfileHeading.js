import './ProfileHeading.css';
import EditProfileButton from '../components/EditProfileButton';

export default function ProfileHeading(props) {
  const backgroundImage = 'url("https://assets.cruddur.net/banners/SOLUSD_2021-11-06_06-14-51.png")';
  const styles = {
    backgroundImage: backgroundImage,
    backgroundSize: 'cover',
    backgroundPosition: 'center',
  };
  return (
   <div className='activity_feed_heading profile_heading'>
    <div className='title'>{props.profile.display_name}</div>
    <div className="cruds_count">{props.profile.cruds_count}Cruds</div>  
    <div className="avatar" styles={styles}>
      <div className="avatar">
        <img src="https://assets.cruddur.net/avatars/geordi.jpg"/>
      </div>
    </div>
        <div className="display_name">{props.display_name}</div>
        <div className="handle">@{props.handle}</div>

        <EditProfileButton setPopped={props.setPopped}/>
   </div>  
  );
}
