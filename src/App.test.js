import { render, screen } from '@testing-library/react';
import App from './App';

test('renders App component as expected', () => {
  render(<App />);
  const linkElement = screen.getByText(/Hello World/i);
  expect(linkElement).toBeInTheDocument();
});
