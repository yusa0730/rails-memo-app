<template>
  <div id="app">
    <ul>
      <li v-for="memo in memos" :key="memo.id">
        {{ memo.title }}： {{ memo.description }}
      </li>
    </ul>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  //data の箇所には、そのファイルで保持したいデータを記載します。
  //今回メモ一覧情報のデータをmemosというプロパティに格納しています
  data: function () {
    return {
      memos: "memos"
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
