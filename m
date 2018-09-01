Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=uVxPRWSE2oTKz7pkaWSGT43L5JySE0zE2bGuKIYORow=;
 b=S5kghuBe+Ru4St6O2gKtrsjc7iNTzOjkstEYJi59EW15LwKB+diGLOOKSjYfN8l2LJ
 mIVbBUjAGDnrmkZsx99MGDmee5QT+0wqXcrdknCiFNhlx0UNKE83bIB8usuZLbxM9EjY
 gcMxWGBxbFjyycmuPa3FBP+txev6eurQGqJkJ2UhtXouvkbTmBODNHO2FvH+49qKdxqn
 9Pzgf29wHWPbtH9dy6IB9++cdjEcMWb1vd4RagnUGyfurv90CBEkgIls/eN6YN3yFI61
 PomOW7k230BtUqDe4tQmGdvuxxGOv08PidpLtnKjim/N3CUgRBb6kVlsqx9IVTeVMfE6
 nbNg==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 0/3] Tweak section-level epigraph
Message-ID: <eb5de77b-fc3f-88d4-f717-c0f7314005e9@gmail.com>
Date: Sat, 1 Sep 2018 09:11:36 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 40c5e61208be1df272b99fa103b9d74ddbb1c379 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 1 Sep 2018 08:45:12 +0900
Subject: [PATCH 0/3] Tweak section-level epigraph

Hi Paul,

Recently, you added section-level epigraphs in debugging chapter.
I noticed minor issues in there appearances.

  1. 1st paragraph of a section is now indented.
  2. In "1csf" target, section-level epigraph of sans serif font
     looks inconsistent with chapter-level epigraph of roman font.

Indent right after an epigraph can be suppressed by using
"noindentafter" package. However, Ubuntu Trusty has a buggy one.
So patch #1 imports the latest one.
Patch #2 enables the \NoIndentAfterCmd setting for \epigraph{}.
Patch #3 removes font family setting in \Epigraph{} for chapter-
level epigraph.

Note that Patch #1 contains trailing blanks.

         Thanks, Akira

Akira Yokosawa (3):
  Import noindentafter.sty 0.2.2
  Suppress indent right after section-level epigraph
  Remove font family specifier in \Epigraph{}

 Makefile          |   1 +
 noindentafter.sty | 189 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 perfbook.tex      |   4 +-
 3 files changed, 193 insertions(+), 1 deletion(-)
 create mode 100644 noindentafter.sty

-- 
2.7.4

