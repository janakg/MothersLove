/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow
 * @lint-ignore-every XPLATJSCOPYRIGHT1
 */

import React, {Component} from 'react';
import {
  Platform,
  StyleSheet,
  Text,
  View,
  NativeModules,
  TouchableOpacity,
  Image,
  Button,
  PixelRatio
} from 'react-native';
import ImagePicker from 'react-native-image-picker'
import Video from 'react-native-video'

const instructions = Platform.select({
  ios: 'Press Cmd+R to reload,\n' + 'Cmd+D or shake for dev menu',
  android:
    'Double tap R on your keyboard to reload,\n' +
    'Shake or press menu button for dev menu',
});

type Props = {};
export default class App extends Component<Props> {

  constructor(props) {
    super(props);
    this.state = {
      value1: 10,
      value2: 5,
      sum: 'Loading...',
      uri: '',
      media: false,
      isProcessing: false
    };
    this.calculateSum();

    this.selectFile = this.selectFile.bind(this)
    this.dehazeFile = this.dehazeFile.bind(this)
    this.resetFile = this.resetFile.bind(this)
  }

  calculateSum = () => {
    const { HelloWorld } = NativeModules;

    // Function "HelloWorld.add(...)" is implemented in c++
    HelloWorld
      .add(this.state.value1, this.state.value2)
      .then(sum => {
        const newState = Object.assign({}, this.state, { sum });
        this.setState(newState);
      });
  };

  selectFile() {
    const options = {
      quality: 1.0,
      videoQuality: 'high',
      maxWidth: 500,
      maxHeight: 500,
      mediaType: 'image',
    }
    ImagePicker.showImagePicker(options, ({ uri, error, didCancel, customButton }) => {
      if (!error && !didCancel && !customButton) {
        const suffix = uri.slice(uri.lastIndexOf('.') + 1).toLowerCase()
        const isImage = ['png', 'jpg', 'jpeg', 'bmp'].includes(suffix)
        const isVideo = ['mp4', 'mov'].includes(suffix)
        this.setState({ uri, media: isImage && 'image' || isVideo && 'video' })
      }
    })
  }

  async dehazeFile() {
    const { uri, media, isProcessing } = this.state
    if (!isProcessing) {
      this.setState(state => ({ ...state, isProcessing: true }))
      const dehazedUri = await NativeModules.Dehaze.run(uri, media)
      this.setState({ uri: dehazedUri, isProcessing: false })
    }
  }

  resetFile() {
    this.setState({ uri: '', media: false })
  }

  renderDisplay() {
    const { uri, media } = this.state
    switch (true) {
        case media === 'image': return (
            <Image
                source={{ isStatic: true, uri }}
                resizeMode="contain"
                style={styles.displayContent}
            />
        )
        case media === 'video': return (
            <Video
                source={{ uri }}
                resizeMode="contain"
                muted={false}
                style={styles.displayContent}
            />
        )
        default: return <Text style={styles.hint}>{uri ? 'Invalid file format' : 'Select a photo'}</Text>
    }
}

render() {
  const { uri, media, isProcessing } = this.state
        return (
            <View style={styles.container}>
                 <Text style={styles.instructions}>
                  {this.state.value1} + {this.state.value2} = {this.state.sum}
                </Text>
                <TouchableOpacity onPress={this.selectFile}>
                    {this.renderDisplay()}
                </TouchableOpacity>
                {media && (
                    <Button
                        title={isProcessing ? 'Processing...' : 'Dehaze'}
                        onPress={this.dehazeFile}
                        color="#71CA58"
                    />
                )}
                {media && (
                    <Button
                        title="Reset"
                        onPress={this.resetFile}
                        color="#FD6461"
                    />
                )}
            </View>
        )
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF',
  },
  welcome: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10,
  },
  instructions: {
    textAlign: 'center',
    color: '#333333',
    marginBottom: 5,
  },
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF',
  },
  displayContent: {
      flex: 1,
      width: 360,
      maxHeight: 480,
      backgroundColor: 'transparent',
  },
  hint: {
      height: 48,
      fontSize: 24,
      color: "#51BAF2",
  },
});
