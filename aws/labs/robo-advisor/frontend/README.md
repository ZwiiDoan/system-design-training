# Robo-Advisor Frontend

This is a sample frontend application for the Robo-Advisor project, built with **React**, **Vite**, **TypeScript**, and **Tailwind CSS**.

## 🚀 Features
- Fast development with [Vite](https://vitejs.dev/)
- Modern UI with [React](https://react.dev/) and [Tailwind CSS](https://tailwindcss.com/)
- Type safety with [TypeScript](https://www.typescriptlang.org/)
- Ready for deployment to AWS S3 + CloudFront

## 📦 Project Structure
```
frontend/
├── src/
│   ├── App.tsx
│   ├── main.tsx
│   └── index.css
├── index.html
├── package.json
├── tailwind.config.js
├── postcss.config.js
├── tsconfig.json
└── ...
```

## 🛠️ Getting Started
1. **Install dependencies:**
   ```powershell
   npm install
   ```
2. **Start the development server:**
   ```powershell
   npm run dev
   ```
   The app will be available at [http://localhost:5173](http://localhost:5173) by default.

3. **Build for production:**
   ```powershell
   npm run build
   ```
   The output will be in the `dist/` folder, ready to deploy to S3.

## 🌐 Deployment
- Upload the contents of the `dist/` folder to an AWS S3 bucket configured for static website hosting.
- Use AWS CloudFront for CDN, HTTPS, and custom domain support.

## 📚 Useful Commands
- `npm run dev` — Start local dev server
- `npm run build` — Build for production
- `npm run preview` — Preview the production build locally

## 📝 Customization
- Edit `src/App.tsx` to change the landing page.
- Tailwind CSS is ready to use in all `.tsx` and `.css` files.

---

*Part of the AWS Foundations Month 1 deliverables for the Robo-Advisor project.*
