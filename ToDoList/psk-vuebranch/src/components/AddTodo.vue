<template>
    <div>
        <form @submit="addTodo">
            <input type="text" v-model="title" name="title" placeholder="Add Todo...">
            <input type="submit" value="Submit" class="btn">
        </form>
    </div>
</template>
<script>
import uuid from 'uuid';
export default {
    name:"AddTodo",
    data(){
        return{
            title: ''
        }
    },
    methods:{
        addTodo(e){
            e.preventDefault();
            console.log(uuid);
            const newTodo = {
                // id: uuid.v4(),
                title: this.title,
                completed:false
            };
            console.log(this.title+"sss");
            //부모 prop으로 보냄
            this.$emit('add-todo',newTodo);
            this.title='';
        }
        
    }
}
</script>

<style scoped>
  form {
    display: flex;
  }
  input[type="text"] {
    flex: 10;
    padding: 5px;
  }
  input[type="submit"] {
    flex: 2;
  }
</style>