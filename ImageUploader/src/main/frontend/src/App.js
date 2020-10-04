import React, {useState, useEffect, useCallback} from 'react';
import logo from './logo.svg';
import './App.css';
import axios from "axios";
import {useDropzone} from 'react-dropzone'



const UserProfiles = ()=>{

  const [userProfiles,setUserProfiles] = useState([]);

  //fetch User Profiles
  const fetchUserProfiles = ()=>{
    axios.get("http://localhost:8080/api/v1/user-profile")
    .then(res=>{
      console.log(res);//check response
      const data = res.data;
      setUserProfiles(res.data);
    });
  }

  //효과(Effect) 추가
  useEffect(()=>{
    fetchUserProfiles();
  },[]);
//userProfileId = {userProfile.userProfileId} equals {...userProfile}
  return userProfiles.map((userProfile, index)=>{
    return (<div key={index}>
      {
      userProfile.userProfileId?(
      <img 
      src={`http://localhost:8080/api/v1/user-profile/${userProfile.userProfileId}/image/download`}
       alt="preview" />
      ):null
    }
      <br />
      <br />
      <h1>{userProfile.username}</h1>
    <p>{userProfile.userProfileId}</p>
    <MyDropzone {...userProfile} />
    <br />
    </div>);
  });
}

function MyDropzone({userProfileId}) {
  const onDrop = useCallback(acceptedFiles => {
    // Do something with the files
    const file = acceptedFiles[0];
    console.log(file);
    const formData = new FormData();
    formData.append("file",file);
    //RequestParam : File
    console.log(formData);
    axios
    .post(`http://localhost:8080/api/v1/user-profile/${userProfileId}/image/upload`
    ,formData,
    {
      headers:{"Content-Type":"multipart/form-data"}
    }).then(
      ()=>{
        console.log("file uploaded successfully");

      }
    ).catch(err=>{
      console.log(err);
    });
  }, []);
  const [userProfiles,setUserProfiles] = useState([]);
  const {getRootProps, getInputProps, isDragActive} = useDropzone({onDrop
    // accept : "image/*",
    // onDrop : (acceptedFiles)=>{
    // setUserProfiles(
    //     acceptedFiles.map((upFile)=>Object.assign(upFile,{
    //       preview : URL.createObjectURL(upFile)
    //     }))
    //   )
    // }
  })


     // {
    //   userProfiles.map((upFile)=>{
    //     return (
    //       <div>
    //         <img src={upFile.preview} alt="preview" />
    //       </div>
    //     )
    //   })
    // }

  return (
    <div {...getRootProps()}>
      <input {...getInputProps()} />
      
      
      {
        isDragActive ?
          <p>이곳에 파일을 끌어다 놓으세요</p> :
          <p>프로필 이미지를 올려놓으세요</p>
      }
      
    </div>
  )
}

function App() {
  return (
    <div className="App">
     <UserProfiles />
    </div>
  );
}

export default App;
