React = require 'react-native'
Post = require './temp'

API = require './API'

{
  StyleSheet,
  Text,
  View,
  Image,
  ListView,
  TouchableHighlight,
  ActivityIndicatorIOS,
} = React

module.exports = React.createClass
  getInitialState: ->
    loading: true
    posts: []

  componentDidMount: ->
    console.log 'fetch!'
    fetch(
      "#{API}/#{@props.site}.json"
    )
      .then (response) =>
        response.json()
      .then (json) =>
        console.log json
        ds = new ListView.DataSource(rowHasChanged: (r1, r2) -> r1 != r2)
        posts = json.months[0].posts
        @setState
          posts: ds.cloneWithRows(posts)
          loading: false

  navToPost: (post) ->
    @props.navigator.push
      title: 'Post'
      component: Post
      passProps: { id: post.id}

  renderRow: (post) ->
    <View>
      <TouchableHighlight
        onPress={() => @navToPost(post)}
      >
        <View style={styles.row}>
          <Image
            style={styles.image}
            source={{uri: post.image}}
          />
          <View style={styles.textContainer}>
            <Text style={styles.headline} numberOfLines={2}>{post.headline}</Text>
          </View>
        </View>
      </TouchableHighlight>
    </View>



  render: ->
    if @state.loading
      <ActivityIndicatorIOS
        animating={@state.loading}
        style={styles.activity}
        size="large"
      />
    else
      <ListView
        dataSource={@state.posts}
        renderRow={@renderRow}
      />


styles = StyleSheet.create
  row:
    flex: 1
    padding: 5
    flexDirection: 'row'
    justifyContent: 'flex-start'
    borderBottomWidth: 0.5
    borderColor: '#ccc'
    backgroundColor: 'white'
  activity:
    flex: 1
    alignSelf: 'center'
  textContainer:
    flex: 1
    # flexShrink: true
  headline:
    flex: 1
    flexWrap: 'wrap'
    fontWeight: '500'
  image:
    width: 100
    height: 60
    marginRight: 10

