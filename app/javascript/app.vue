<template>
  <div id="app">
    <ul>
      <li v-for="memo in memos" :key="memo.id">
        {{ memo.title }} : {{ memo.description }}
      </li>
    </ul>
  </div>
</template>

<script>
// axiosというモジュールをインポートしています。
import axios from 'axios';

export default {
  data: function () {
    return {
      memos: "memos"
    }
  },
  mounted () {
    this.setMemo();
  },
  methods: {
    setMemo: function() {
      axios.get('/api/memos')
      // .then()で通信が成功した際の処理を書きます。
      .then(response => (
        // Axiosで呼び出したAPIの情報をmemosに代入しています。
        this.memos = response.data
      ))
    }
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
