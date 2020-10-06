<template>
  <div id="app">
    <!-- <img alt="Vue logo" src="./assets/logo.png"> -->
    <!-- <HelloWorld msg="Welcome to Your Vue.js App"/> -->
    <!-- {{msg}} -->
    <!-- <Header /> -->
    <AddTodo v-on:add-todo="addTodo"/>
    <Todos v-bind:todos="todos" v-on:del-todo="deleteTodo"/>
  </div>
</template>

<script>
// import HelloWorld from './components/HelloWorld.vue'
// import Header from '../components/layout/Header';
import Todos from '../components/Todos';
import AddTodo from '../components/AddTodo';
import axios from 'axios'
export default {
  name: 'Home',
  components: {
    // HelloWorld
    // Header,
    Todos,
    AddTodo
  },
  data(){
    return {
      todos:[]
      // todos: [
      //   {
      //     id:1,
      //     title: "Todo One",
      //     completed: true,
          
      //   },
      //   {
      //     id:2,
      //     title: "Todo Two",
      //       completed: true
            
      //   },
      //   {
      //     id:3,
      //     title: "Todo Three",
      //      completed: false
      //   }
        
      // ]
    }
  },
  //유의
  methods:{
    deleteTodo(id){
      axios.delete(`https://jsonplaceholder.typicode.com/todos/${id}`)
      .then(res=>{
        console.log(res);
        this.todos = this.todos.filter(todo=>todo.id!==id);
      })
      .catch(err=>console.log(err));
      
    },
    addTodo(newTodo){
      const{title,completed} = newTodo;
      axios.post('https://jsonplaceholder.typicode.com/todos',{
        title,
        completed
      })
      .then(res=>this.todos = [...this.todos, res.data])
      .catch(err=>console.log(err));
      
    }
  },
  created(){
    axios.get('https://jsonplaceholder.typicode.com/todos?_limit=5')//최초 JSON 데이터 긁어오기
    .then(res=>this.todos=res.data)
    .catch(err=>console.log(err));
  }
}
</script>

<style>
/* #app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
} */

*{
  box-sizing: border-box;
  margin: 0;
  padding: 0;
}
body{
  font-family: Arial, Helvetica, sans-serif;
  line-height: 1.4;
}
</style>

