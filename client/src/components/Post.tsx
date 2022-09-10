import React, { useContext, useEffect, useState } from 'react'
import { environment } from '../environments/environment'
import Text from './Text'
import '../styles/Post.scss'
import { AiFillStar, AiOutlineStar } from 'react-icons/ai'
import { FaHeart, FaRegCommentDots, FaRegHeart } from 'react-icons/fa'
import { FiShare2, FiTrash2 } from 'react-icons/fi'
import { useNavigate } from 'react-router-dom'
import axios from 'axios'
import { AuthContext } from '../Auth'
import { DataContext } from '../DataContext'
import Modal from './Modal'
import { screenRatio } from '../ScreenRatio'

interface PostProps { 
    handle: string,
    username: string,
    media: string,
    text_message: string,
    likes: number,
    date: string,
    isVideo: boolean,
    postId: string,
    nbComments: number,
    isFaved: boolean,
    isLiked: boolean,
}

function Post({handle, username, media, text_message, likes, date, postId, nbComments, isFaved, isLiked}:PostProps) {
    let navigate = useNavigate();
    const {data} = useContext(DataContext);
    const {currentUser} = useContext(AuthContext);
    const [bookmarked, setBookmark] = useState(isFaved);
    const [liked, setLike] = useState(isLiked);
    const [nbLikes, setLikes] = useState(likes);
    
    const like = (liked: boolean) => {
        if(liked) {
            setLikes(nbLikes + 1);
            axios.post(`${environment.serverUrl}/database/like/${currentUser.email}..${postId}`);
        }
        else {
            setLikes(nbLikes - 1);
            axios.post(`${environment.serverUrl}/database/delike/${currentUser.email}..${postId}`);
        }
        setLike(liked);
    }

    const bookmark = (add: boolean) => {
        if(add) {
            
            axios.post(`${environment.serverUrl}/database/favorite/${currentUser.email}..${postId}`);
        }
        else {
            
            axios.post(`${environment.serverUrl}/database/defavorite/${currentUser.email}..${postId}`);
        }
        setBookmark(add);
    }

    function deletePost() {
        let file = media.replace('./assets/videos/', '').replace('./assets/profile-pics/', '');
        axios.delete(`${environment.serverUrl}/database/removePost/${postId}`);
        document.getElementById(`${postId}`)?.classList.add('remove');
        axios.delete(`${environment.serverUrl}/removePic/${file}`);
    }

    function redirect() {
        if(handle === data.handle) {
            navigate(`/User/Profile`, { replace: true }); 
            window.location.reload();
        } else {
            navigate(`/User/Profile/${handle}`, { replace: true }); 
            window.location.reload();
        }
    }

    useEffect(()=>{}, [bookmarked, liked, nbLikes]);

    return (
        <div className='post' id = {postId}>
            <div className = 'header'>
                <div className = 'poster' onClick={() => {redirect()}}>
                    <img src={`${environment.serverUrl}/database/image/${handle}`} alt="" />
                    <Text type='H3 bold' content={`${username}`}></Text>
                </div>
                <Text content={date} color = 'rgba(0, 0, 0, 0.53)'/>
                {handle === data.handle ? 
                    <div className='bookmark-area' onClick = {()=>{deletePost()}}>
                        <FiTrash2 className = 'trash' size = {28*(screenRatio.getRatio())}/>
                    </div> :
                    <div onClick={() => {bookmark(!bookmarked)}} className='bookmark-area'>
                        {bookmarked ? <AiFillStar color = '#8773F0' size={32*(screenRatio.getRatio())}/> : <AiOutlineStar color = 'black' size={32*(screenRatio.getRatio())}/>}
                    </div>
                }
                
            </div>
            <Text content={text_message}/>
            {media.slice(-3) === 'mp4' ? 
            <div className='video-container'>
                <video style={{width: 'calc(Var(--adjustedRatio)*600px)', height: 'calc(Var(--adjustedRatio)*300px)'}} controls src={`${environment.serverUrl}/video/${media.replace('./assets/videos/', '')}`}></video> 
            </div>
            :

            <div className = 'size-restricter' id = {postId + media} onClick={()=>{
                if(document.getElementById(`${postId}`)?.classList.contains('display')) {
                    document.getElementById(`${postId}`)?.classList.remove('display');
                    document.getElementById(`${postId + media}`)?.classList.remove('background');
                } else {
                    document.getElementById(`${postId}`)?.classList.add('display');
                    document.getElementById(`${postId + media}`)?.classList.add('background');
                }
                }}>
                <img className = 'image-post' id = {postId} src= {`${environment.serverUrl}/image/${media.replace('./assets/profile-pics/', '')}`} alt="" />
            </div>
            }
            <div className = 'footer'>
                <div id = 'likes' onClick={() => {like(!liked)}}>
                    {liked ? <FaHeart color='red' size={24*(screenRatio.getRatio())}/> : <FaRegHeart color='black' size={24*(screenRatio.getRatio())}/>}
                    <Text content = {nbLikes.toString()}></Text>
                </div>
                <Modal triggerElement={
                    <div id = 'comments'>
                        {<FaRegCommentDots size={24*(screenRatio.getRatio())}/>}
                        <Text content = {nbComments.toString()}></Text>
                    </div>} 
                    title={'Comments'} 
                    modalWidth={'800px'} 
                    modalHeight={'800px'}>
                        <div>
                            <div>{postId}</div>
                        </div>
                </Modal>
                {<FiShare2 className='share-area' color='grey' size={24*(screenRatio.getRatio())} />}
            </div>
        </div>
    )
}



export default Post