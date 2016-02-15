Return-Path: <andrew.donnellan@au1.ibm.com>
From: Andrew Donnellan <andrew.donnellan@au1.ibm.com>
Subject: [PATCH] FAQ: Add note on installing Steel City Comic font
Date: Mon, 15 Feb 2016 15:02:09 +1100
Message-Id: <1455508929-12672-1-git-send-email-andrew.donnellan@au1.ibm.com>
To: perfbook@vger.kernel.org, paulmck@linux.vnet.ibm.com
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: Andrew Donnellan <andrew.donnellan@au1.ibm.com>

---

I needed to do this to get the comics to render properly - it took me a
while to figure out. By the looks of it, there's no way to get Inkscape to
pick up a font from a custom directory. If anyone's found a neater way to
do this let me know.
---
 FAQ.txt | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/FAQ.txt b/FAQ.txt
index 80fe7f2..57ab6c9 100644
--- a/FAQ.txt
+++ b/FAQ.txt
@@ -1,6 +1,13 @@
 1.	OK, I have downloaded this stuff.  What do I do now?

-	A.	Type "make" from the top-level directory.  If all goes
+	A.	First, install the Steel City Comic font from
+		fonts/steel-city-comic.regular.ttf. On most modern
+		Linux systems, this can be done easily from your
+		desktop environment, or by copying the file to the
+		~/.fonts directory. You may need to run "fc-cache" to
+		rebuild your font cache.
+		
+		Type "make" from the top-level directory.  If all goes
 		well, this will produce a file named "perfbook.pdf",
 		which prints two virtual pages per physical page.

-- 
Andrew Donnellan              Software Engineer, OzLabs
andrew.donnellan@au1.ibm.com  Australia Development Lab, Canberra
+61 2 6201 8874 (work)        IBM Australia Limited

