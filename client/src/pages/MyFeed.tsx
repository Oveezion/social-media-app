import React from 'react'
import LeftSidePane from '../components/LeftSidePane'
import NavBar from '../components/NavBar'
import RightSidePane from '../components/RightSidePane'

const MyFeed = () => {
  return (
    <div>
      <div className='LeftSideContainer'><LeftSidePane /></div>
      <div>
        <NavBar selection='myFeed' />
        MyFeed
      </div>
      <div className ='RightSideContainer'><RightSidePane /></div>
    </div>
  )
}

export default MyFeed