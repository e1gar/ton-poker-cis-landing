# TON Poker CIS — продолжить с этого места

Проект: статический лендинг (Astro), партнёрские переходы через `/partner/web` и `/partner/tg`.

## Пути и репозиторий

- Корень проекта: `sites/cis-landing` (относительно монорепы `Ton`).
- Git: `https://github.com/e1gar/ton-poker-cis-landing`, ветка `main`.
- Последний зафиксированный коммит в сессии: см. `git log -1` (сообщение про контент/UI, FAQ-ссылки, отступы, No KYC).

## Команды

```bash
cd sites/cis-landing
npm install
npm run dev
npm run build
```

## Ключевые файлы

| Назначение | Файл |
|------------|------|
| Главная страница, FAQ, hero, секции, age gate | `src/pages/index.astro` |
| Глобальные стили | `src/styles/global.css` |
| Шаблон HTML/мета | `src/layouts/BaseLayout.astro` |
| Редирект web / tg | `src/pages/partner/web.astro`, `src/pages/partner/tg.astro` (целевые URL внутри файлов) |
| SEO-обвязка | `astro.config.mjs` (`site` сейчас заглушка), `public/robots.txt` |

## Уже реализовано (кратко)

- Age gate `18+`, `localStorage` ключ `ton-poker-age-confirmed`; «Скоро будет» уводит на Google.
- CTA везде на `/partner/web` и `/partner/tg`, `rel="sponsored"` где уместно.
- FAQ + JSON-LD `FAQPage`; у части ответов ссылка на web: поле `linkPhraseToWeb` + `faqWebLinkParts()` (оборачивает **первое** вхождение фразы).
- Секция `#access` стоит **перед** `#start` (порядок: why → access → start → FAQ → final CTA).
- Плашка **No KYC** в stats-strip с классом `stat-accent`.
- Отступы секций/footer/hero уже **уплотнены** относительно первой версии.
- Орфография: **Выбирайте стол**; англ. **Hold'em** в meta и hero.
- Смешение **web / Web / веб** в тексте — **намеренно под SEO**, не выравнивать в одно «веб» без обсуждения.

## Перед продакшеном (часто забывают)

1. В `astro.config.mjs` заменить `site` на **боевой HTTPS-домен**.
2. В `public/robots.txt` — актуальный URL **sitemap**.
3. Search Console / Вебмастер, sitemap, мониторинг индекса.
4. Юридически перепроверить жёсткие формулировки (KYC, ~12 сек и т.д.) под актуальный оффер.

## Идеи для следующего шага (SEO/продукт)

- Доп. схема `WebSite` / `Organization` (осторожно с недоказанными claims).
- Аналитика + UTM на исходящие ссылки.
- Lighthouse после деплоя на реальном домене.

## Контекст для ассистента

Пользователь предпочитает ответы **по-русски**, кратко; команды — отдельным блоком для копирования. Править только то, что относится к задаче.
