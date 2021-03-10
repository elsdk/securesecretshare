import { HashRouter as Router } from 'react-router-dom';
import { Container } from '@material-ui/core';
import { ThemeProvider } from '@material-ui/core/styles';

import { Header } from './shared/Header';
import { Routes } from './Routes';
import { theme } from './theme';

const App = () => {
  if ('serviceWorker' in navigator) {
    navigator.serviceWorker.getRegistrations().then((registrations) => {
      for (const registration of registrations) {
        registration.unregister();
      }
    });
  }

  return (
    <ThemeProvider theme={theme}>
      <Router>
        <Header />
        <Container maxWidth={'lg'}>
          <Routes />
        </Container>
      </Router>
    </ThemeProvider>
  );
};

export default App;
