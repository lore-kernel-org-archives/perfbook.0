Return-Path: <SRS0=QZ2n=I2=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=pn2PlkdGTqBedO/NrisYBUEbYuRXwg7Z/FY4go/56nA=;
        b=bLtBOUIejGdtYVsEwvr4eRQooWveiHB3zM0cCIsn91bXLTgpVPSZ5ovYU/vXQ4Jl41
         IElZDf/ghIsjjz0NhSxMoZxdyNcUuFNzJKjPJdqxSIR2QKDWrTFSQhGBZ0JbjV7rGn1C
         DzzAeJTaF8ri3Frnbcnmn2pJQ8vwJjZphZ0k1P75e2Gt3t+AuMvOPQo26AR/0yp3E0yZ
         EkxJ62hiE8fssMy8kigGmwR4BdKwQ0ngZQxyc++72/C9C7ST+gec02ehWXOgqTP9tT3K
         T8WPX6LoT8QG8zdrW9Sx9FoXGB4Cz1aAykA1eDkFwV2tBQfd95Y+Xwbsu0UDaoOxEYQ3
         c6IQ==
Subject: [PATCH -perfbook 1/5] index: Adjust settings respecting ebook-size
 build
References: <d63ba139-abc7-3837-b44a-294a48a1b216@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <a910dced-9c53-1578-8017-c1c51c1fc74c@gmail.com>
Date: Sun, 28 Mar 2021 17:51:44 +0900
MIME-Version: 1.0
In-Reply-To: <d63ba139-abc7-3837-b44a-294a48a1b216@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

The \newgeometry{} command is for index pages in 1c-layout can have
three-column layout.
It is not necessary for ebook-size build.

Furthermore, ebook size can not afford the three-column index pages.
Use the two-column layout instead.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 perfbook-lt.tex | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/perfbook-lt.tex b/perfbook-lt.tex
index 1272fc95..8a29310d 100644
--- a/perfbook-lt.tex
+++ b/perfbook-lt.tex
@@ -545,15 +545,17 @@
 \cleardoublepage
 \phantomsection
 \IfTwoColumn{}{
+\IfEbookSize{\idxlayout{columns=2}}{
 \newgeometry{body={6.5in,8.25in},centering=true,columnsep=0.25in}
-}
+}}
 \printindex
 \cleardoublepage
 \phantomsection
 \printindex[api]
 \IfTwoColumn{}{
+\IfEbookSize{}{
 \restoregeometry
-}
+}}
 }{}
 
 % page-layout dimensions
-- 
2.17.1


