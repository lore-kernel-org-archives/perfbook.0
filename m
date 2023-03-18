Return-Path: <SRS0=gYOr=7K=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679182875;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PyHj06q0Pwg3o3p4cF99gS5nmDSGNX0zVPhZKV5FudA=;
        b=GRKjXlTsyukhikjcbGGVRGaJ4ZPhBPB5LYyt5nLHUeoCyrmVNrfwpPxuBo0NgNiI8G
         drkT2GXWSTugf+FEYTn/fUkkhC5n5D56zBTC2hF8y4uVT/LNq2UGp96P+f8eUKT6yXxH
         7n+1HF+lfdlAiLf+m7WTq6rlMFoQTmIpep3cEhhNP+AUAZOMcB9hj59QSGk359L/vVd/
         CW6rKhbDaOM/bA8Med0Pt5yzfh2PoNQFosiw+csgRqiHxb30IMXnRT/BRTlLZQ9Ugabr
         WVcmElfhl6xZxB3ru3IiuRF3uPrc96ZnhSK92xwVUx9lmxYTWqWwuvs1sWN0STQWswk3
         WFbw==
Message-ID: <475eb10b-a10c-a3ec-0651-b122f00bdff0@gmail.com>
Date: Sun, 19 Mar 2023 08:41:11 +0900
MIME-Version: 1.0
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook 1/3] Fix warning of missing font shape
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Since commit 6be27f7414d8 ("Use Biolinum font family for epigraph"),
new warning messages appear in the .log file which read:

    LaTeX Font Warning: Font shape `OT1/minntx/sb/n' undefined
    (Font)              using `OT1/minntx/m/n' instead on input line 622.

    LaTeX Font Warning: Some font shapes were not available, defaults
    substituted.

This is because the netwxmath package detects boilinum/libertine fonts
which have semi-bold shape and sets the option of semi-bold shape
for bold math on top of newtxtext's default font (Times Roman clone),
which doesn't provide semi-bold shape.

Using 'OT1/minntx/m/n' for bold math means it will be rendered in
normal (non-bold) shape.

This might be a bug in newtxmath, but can be avoided by moving the
load of biolinum after the load of newtxmath.

Currently, perfbook doesn't use \mathbf{} and there is no visible
defect in rendered math equations.  But it is better to fix this
potential regression sooner rather than later.

After loading biolinum, restore newtxtext's \sfdefault (Helvetica
clone).

Fixes: 6be27f7414d8 ("Use Biolinum font family for epigraph")
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 perfbook-lt.tex | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/perfbook-lt.tex b/perfbook-lt.tex
index f970212cb194..efb49bd0abe7 100644
--- a/perfbook-lt.tex
+++ b/perfbook-lt.tex
@@ -13,7 +13,6 @@
 
 % A more pleasant font
 \usepackage[full]{textcomp} % use symbols in TS1 encoding
-\usepackage{biolinum}
 \usepackage{lmodern}
 \usepackage[T1]{fontenc} % use postscript type 1 fonts
 \usepackage[defaultsups,helvratio=0.9]{newtxtext} % use nice, standard fonts for roman
@@ -324,6 +323,9 @@
   \DeclareFontShape{\encodingdefault}{\rmdefault}{bx}{sl}{<->ssub * ptm/b/sl}{}%
 }
 }
+\usepackage{biolinum}
+% restore \sfdefault of newtxtext
+\renewcommand{\sfdefault}{qhv}
 
 \newcommand{\LstLineNo}{\makebox[5ex][r]{\arabic{VerbboxLineNo}\hspace{2ex}}}
 

base-commit: 2d2853f4b29d0369dd3b64435d5a53203380cf96
-- 
2.25.1

