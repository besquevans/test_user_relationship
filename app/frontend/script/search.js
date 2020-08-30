import axios from 'axios'

const url = 'http://localhost:3000'
const limitCount = 5

document.addEventListener("turbolinks:load", () => {
  console.log("start")
  const searchForm = document.querySelector(".search-form")
  const searchResult = document.querySelector(".search-result")

  if(searchForm){
    searchForm.addEventListener("submit", (e) => searchUser(e))
    searchForm.addEventListener("keyup", (e) => searchUser(e))
  }

  const searchUser = (e) => {
    e.preventDefault()
    searchResult.innerHTML = ''
    console.log("rrrrr")

    axios.get(`${url}/api/v1/users`)
    .then((response) => response.data)
    .then((users) => {
      let userCount = 0
      for(let i in users) {
        userCount += createUserItem(users[i])

        if (userCount === limitCount) {
          break
        }
      }
    })
  }

  const createUserItem = (user) => {
    const t = document.querySelector("#user-item")
    const clone = document.importNode(t.content, true)
    const keyword = searchForm.keyword.value

    if (user.nick_name.includes(keyword)){
      clone.querySelector(".user-avatar").src = user.avatar.url
      clone.querySelector(".user-name").textContent = user.nick_name
      searchResult.appendChild(clone)
      return 1
    } else {
      return 0
    }
  }

})
