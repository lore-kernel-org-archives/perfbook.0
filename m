Return-Path: <SRS0=TMph=R2=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=kTQn96aHzg7xdKTJH9KQ/qZgUF8a2YL2STG9NWPyzqA=;
        b=S9pdD9qcuZau0JVeUbKnDxTa3kwwNRw0T4Mk705xxYTMNn4KzXnAw44WLDJrCekHz6
         BGUky0195KscsAzKP6QTyNewMk5mWfHqZ/Xl0gGAqMi+IAk4EtymV/PDojw1ro4tfvPU
         cqvpMgZ4o89rqUM2crVqTaeaFo4ROUDqIR55LRDMh9770VNxDc0MiH2uf8XSli75IzgN
         J6sgfvTVIcLZnI57FfSIQM/1iA/KbqHRrR3+7M8L2PeUoMdvxKAVWfxoJR1w3qvafp5C
         VZ8G57P4VJWwgF9s3v73ALgi92YJwPSrZd9uJ4TrBNBywrm5KMBAOe5KI9sw9reFfzRk
         nWxA==
Subject: [PATCH -perfbook 4/5] Add explicit 'helvratio' value to newtxtext
References: <92fe431a-fa47-add9-3899-77ff9ec57503@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <edacb006-cdff-26b9-e680-565f9d373dfb@gmail.com>
Date: Mon, 10 Jan 2022 20:20:40 +0900
MIME-Version: 1.0
In-Reply-To: <92fe431a-fa47-add9-3899-77ff9ec57503@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

The "helvratio" option of "newtxtext" package specifies size of
sans-serif font relative to that of serif font.
newtx version 1.7 changed its default value from 0.90 to 0.94.
Add an explicit option with the old default value of 0.9 to keep
the same behavior across old and new newtx versions.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 perfbook-lt.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/perfbook-lt.tex b/perfbook-lt.tex
index 563e586d..98899d80 100644
--- a/perfbook-lt.tex
+++ b/perfbook-lt.tex
@@ -14,7 +14,7 @@
 % A more pleasant font
 \usepackage{lmodern}
 \usepackage[T1]{fontenc} % use postscript type 1 fonts
-\usepackage[defaultsups]{newtxtext} % use nice, standard fonts for roman
+\usepackage[defaultsups,helvratio=0.9]{newtxtext} % use nice, standard fonts for roman
 \usepackage{textcomp} % use symbols in TS1 encoding
 
 % Improves the text layout
-- 
2.17.1


