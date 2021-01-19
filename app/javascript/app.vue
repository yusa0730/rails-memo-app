<template>
  <div id="app">
    <ul>
      <li v-for="memo in memos" :key="memo.id">
        {{ memo.title }}： {{ memo.description }}
      </li>
    </ul>
    <div>
      <!-- v-model を使うことで、data () {}で定義したプロパティの値を更新できます。 -->
      <!-- v-model はフォームに入力した値をdataオプションの中で該当するプロパティを自動的に更新します。 -->
      <input v-model="title" placeholder="title">
      <input v-model="description" placeholder="description">
      <!-- 例:<button v-on:イベント名="関数"></button> -->
      <!-- 省略例:<button @イベント名="関数"></button> -->
      <button @click="addMemo">メモを追加</button>
    </div>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  //data の箇所には、そのファイルで保持したいデータを記載します。
  //今回メモ一覧情報のデータをmemosというプロパティに格納しています
  data: function () {
    return {
      memos: "memos",
      title: "",
      description: "",
    }
  },
  // mounted() で、アプリが立ち上がった最初のタイミングで実行される関数を定義できます。
  // つまり、app.vueファイルが読み込まれた時点で、setMemo関数を呼び出しています。
  mounted() {
    this.setMemo();
  },
  methods: {
    setMemo: function() {
      // axios.get('/api/memos') というコードで、APIを呼び出しています。
      // axios.HTTP動詞('url')
      axios.get('/api/memos')
      // .then()で通信が成功した際の処理を書きます。
      .then(response => (
        // this.memos = response.dataでAxiosで呼び出したAPIの情報をmemosに代入しています。
        // つまりresponse.data に呼び出したAPIの情報が入っています
        this.memos = response.data
      ))
    },
    addMemo: function() {
      axios.post('/api/memos', {
        title: this.title,
        description: this.description
      })
      // .then()で通信が成功した際の処理を書きます。
      .then(response => (
        this.setMemo()
      ));
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
