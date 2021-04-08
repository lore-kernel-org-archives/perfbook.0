Return-Path: <SRS0=Q5ML=JF=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=MaNDe++DwsDfPiQhGHZ3RJQSqLV+v2RL5WQkJeKakIc=;
        b=ZwnVKDTywvvtnO3mGVlYDU2QEkEV7nwGrepnQoo13Ijx0EZ7AnOZazDGfXtKdWa/mu
         /hnLpJqB4rzg/GpoXYGHy8S9GpL9LjMSyM6yHxMjfAsRr2t8u+ZQ6HEKvPObabl8qmgW
         VR6o5VtWmqksfVF85Lcpo1T2/TmcphQoXQ1MMkUESAQjfpWJKa7hkcwYyuQ+E0YTl9uu
         y3C+VuU+6XcnjDbGpEBzh0qEYGxz/D+NS1wgaNg2mmqKjd+bc0qZEnbRzvdacvWV8gQ4
         /6ivb1PRocZ8Ug6Cm77dMjwjevceH8d4SraqLWZAoSPHWhJ43+gCjxMYg4bzXKhE0jL/
         Bjgg==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook 1/2] Makefile: Disable qqzbg in -nq builds
Message-ID: <892ebe26-b120-a726-434b-97ab25187b53@gmail.com>
Date: Thu, 8 Apr 2021 20:08:48 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

"noqqz" assumes "qqzbg" is disabled.
This change recovers page count in the top-right corner of quiz part.

Fixes: 283bf48cfa39 ("Makefile: Update rules to reflect help text")
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 5f17b126..cd8ee7ff 100644
--- a/Makefile
+++ b/Makefile
@@ -373,7 +373,8 @@ perfbook-1csfnq.tex: perfbook-1csf.tex
 perfbook-ebnq.tex: perfbook-eb.tex
 perfbook-ebsfnq.tex: perfbook-ebsf.tex
 perfbook-nq.tex perfbook-sfnq.tex perfbook-1cnq.tex perfbook-1csfnq.tex perfbook-ebnq.tex perfbook-ebsfnq.tex:
-	sed -e 's/setboolean{noqqz}{false}/setboolean{noqqz}{true}/' \
+	sed -e 's/setboolean{qqzbg}{true}/setboolean{qqzbg}{false}/' \
+	    -e 's/setboolean{noqqz}{false}/setboolean{noqqz}{true}/' \
 	    -e 's/{qqzchpend}{false}/{qqzchpend}{true}/' < $< > $@
 
 perfbook-ix.tex: $(PERFBOOK_BASE)
-- 
2.17.1

