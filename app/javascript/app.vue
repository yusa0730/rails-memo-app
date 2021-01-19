<template>
  <div id="app">
    <div class="form">
      <div class="form-group">
        <!-- v-model を使うことで、data () {}で定義したプロパティの値を更新できます。 -->
        <!-- v-model はフォームに入力した値をdataオプションの中で該当するプロパティを自動的に更新します。 -->
        <input v-model="title" placeholder="title">
      </div>
      <div class="form-group">
        <input v-model="description" placeholder="description">
      </div>
      <!-- 例:<button v-on:イベント名="関数"></button> -->
      <!-- 省略例:<button @イベント名="関数"></button> -->
      <button @click="addMemo">メモを追加</button>
    </div>
    <div class="flex">
      <div v-for="memo in memos" :key="memo.id" class="card">
        <div class="card-body">
          <div class="card-title">
            {{ memo.title }}
          </div>
          {{ memo.description }}
        </div>
      </div>
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

<style lang="scss" scoped>
  .form {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    margin: 32px;
    &-group {
      margin-bottom: 1rem;
    }
    &-control {
      width: 600px;
      min-height: 24px;
      font-size: 1rem;
      border: 1px solid #ced4da;
      padding: 4px 8px;
    }
  }

  button {
    width: 200px;
  }

  .flex {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
  }

  .card {
    width: 238px;
    border: 1px solid rgba(0,0,0,.125);
    border-radius: .25rem;
    margin: 16px;
    &-body {
      padding: 1.25rem;
    }
    &-title {
      margin-bottom: .75rem;
      font-weight: 600;
    }
  }
</style>
