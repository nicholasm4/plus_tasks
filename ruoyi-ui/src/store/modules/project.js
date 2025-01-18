const state = {
  listLastTime: 0
}

const mutations = {
  SET_LIST_LAST_TIME: (state, value) => {
    state.listLastTime = value
  }
}

const actions = {
  // 设置字典
  setListLastTime({ commit }) {
    commit('SET_LIST_LAST_TIME', new Date().getTime())
  },
}

export default {
  namespaced: true,
  state,
  mutations,
  actions
}

