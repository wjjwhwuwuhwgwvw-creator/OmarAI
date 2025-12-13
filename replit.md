# Omar AI WhatsApp Bot

## Overview
بوت واتساب ذكي متعدد الوظائف مبني بـ Baileys و Google Gemini AI.

## Recent Changes (December 2025)

### File Structure Reorganization:
- تم إعادة تنظيم الملفات لتكون أكثر ترتيباً

### New Features Added:
1. **Anti-Link System** - حذف الروابط وطرد المرسل تلقائياً (مع استثناء المسؤولين)
2. **Anti-Bad Words** - نظام تحذير وطرد للكلمات السيئة مع تحذيرات متعددة
3. **Anti-Private** - رد تلقائي على الرسائل الخاصة مع رابط المجموعة
4. **Anti-Time** - إغلاق/فتح المجموعة تلقائياً حسب الجدول الزمني
5. **Improved Gemini Image Reading** - تحسين قراءة الصور باستخدام gemini-2.0-flash
6. **New Command Plugins**: ping, owner, ai-image, groupadmin
7. **Large File Splitting** - تقسيم الملفات الكبيرة (>1.9GB) تلقائياً لـ GDrive و Mediafire

### Plugin Structure:
- **URL-based plugins**: تعمل عند إرسال رابط (YouTube, Instagram, etc.)
- **Command-based plugins**: تعمل بأوامر محددة (ping, owner, ai-image)

## Bot Behavior

### الرسائل:
- **المجموعات**: البوت يرد على جميع الرسائل في المجموعات
- **الخاص**: البوت للمجموعات فقط - أي رسالة خاصة ستؤدي لحظر المرسل (باستثناء المطورين و VIP)

### الأزرار التفاعلية:
- أي شخص في المحادثة يمكنه الضغط على الأزرار
- ليس مخصص فقط لمن طلبها

## Project Architecture

```
/
├── bot.js                    # الملف الرئيسي للبوت
├── config/
│   └── config.js             # إعدادات البوت
├── src/
│   ├── api/
│   │   └── api_server.py     # API خادم التحميلات
│   ├── utils/
│   │   ├── gemini-brain.js   # معالجة الذكاء الاصطناعي
│   │   └── gemini-scraper.js # scraper للـ Gemini
│   ├── storage.js            # تخزين البيانات (JSON-based)
│   ├── group-manager.js      # إدارة المجموعات والحماية
│   └── interactive-buttons.js # الأزرار التفاعلية
├── plugins/                   # الإضافات
│   ├── facebook.js
│   ├── instagram.js
│   ├── tiktok.js
│   ├── twitter.js
│   ├── youtube.js
│   ├── pinterest.js
│   ├── gdrive.js
│   ├── mediafire.js
│   ├── ping.js
│   ├── owner.js
│   ├── ai-image.js
│   ├── groupadmin.js
│   └── allfake.js
├── data/                      # ملفات البيانات
│   ├── blocklist.json
│   ├── users.json
│   ├── downloads.json
│   └── groups.json
├── session/                   # ملفات الجلسة (WhatsApp)
├── conversations/             # سجل المحادثات
├── downloads/                 # التحميلات المؤقتة
└── app_cache/                 # cache التطبيقات
```

## Group Management Commands

### For Admins:
- `antilink on/off` - تفعيل/إلغاء حذف الروابط
- `antibadwords on/off` - تفعيل/إلغاء فلتر الكلمات
- `antitime on/off` - تفعيل/إلغاء الإغلاق التلقائي
- `antitime set HH:MM HH:MM` - تحديد أوقات الإغلاق/الفتح
- `antitime status` - عرض حالة الإغلاق التلقائي
- `groupsettings` - عرض جميع الإعدادات

## User Preferences
- Language: Arabic (Moroccan Darija)
- Response style: Friendly and helpful
- No emojis in responses unless requested

## Workflows
- **API Server**: `python src/api/api_server.py` (Port 8000)
- **WhatsApp Bot**: `node bot.js`

## Environment Variables
- `GEMINI_API_KEY` - مفتاح Google Gemini API

## Data Storage
All data is stored in JSON files under `data/`:
- `blocklist.json` - قائمة المحظورين
- `users.json` - بيانات المستخدمين
- `downloads.json` - سجل التحميلات
- `groups.json` - إعدادات المجموعات
