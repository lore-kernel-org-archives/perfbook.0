Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=to:cc:references:from:subject:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mhCGv6r6Pag51ZeQnR3KnWtqqoKYiOZAvRH/+EX92mg=;
 b=VLCJVllHbRkb6iPtggNunN+B7V8DVDBhn9XVd8e3BCMNwMsHnMCepcdHh8/99qPpiX
 WrXg0GEPWTuPxO+q7bU8Kfg/ojPH/4E98rU9d5/DmwW24FntuK+OQeBhhkOzGAYvtN7L
 d38dXg/nmvMAvZJh3CETgyJ2d5TZ/ptt/jv2omPq0dLjRuOxGyRdbS69XhL6i7TmfYYp
 wGusGyOwWrtAPTuQRFdZdw5IGegrIM7enLjhr0QkGEFO60wRoRm9fAypiV3K8pU9ihIc
 olfmVOJ2LaPVGkNYcIg9D6r3YAuTsD3xm8GILV6pAcQUu6wgZPojSz1fAPyc7L5306g/
 q2Kg==
References: <26a47dec-a9a0-87e6-88c8-b9ba82c477d5@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH v2 0/8] Add style guide
Message-ID: <11d41e53-5367-1149-8064-8808696a2c33@gmail.com>
Date: Mon, 31 Jul 2017 23:43:41 +0900
MIME-Version: 1.0
In-Reply-To: <26a47dec-a9a0-87e6-88c8-b9ba82c477d5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From e35b5bc0c56f255caee91054f05a5dd7b824b5fa Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 31 Jul 2017 23:20:57 +0900
Subject: [PATCH v2 0/8] Add style guide

Hi Paul,

This is the respin I mentioned earlier.
Patch #2 has a few more changes from v1 to modify strings of package name.
Other than that, the end result should be the same as v1.

Note on the status of the floatrow package:

Current version v0.3b was revised 2009/08/02.
There has been no update since.
I'm not sure if upstreaming is possible.

        Thanks, Akira
--
Akira Yokosawa (8):
  Localize floatrow.sty as floatrowpf.sty
  Apply workaround to floatrowpf.sty
  Define 'listing' environment for style guide
  styleguide: Add listing environment examples
  Disable 'floatrow' layout in manually aligned code snippets
  styleguide: Add example of grouping code snippets
  styleguide: Add example of preferred table layout using 'booktabs'
  styleguide: Tweak layout of 'Limitation' table

 appendix/styleguide/hello.c        |    9 +
 appendix/styleguide/styleguide.tex |  177 ++++-
 defer/rcuusage.tex                 |    6 +-
 floatrowpf.sty                     | 1482 ++++++++++++++++++++++++++++++++++++
 howto/howto.tex                    |    4 +-
 perfbook.tex                       |    4 +
 6 files changed, 1668 insertions(+), 14 deletions(-)
 create mode 100644 appendix/styleguide/hello.c
 create mode 100644 floatrowpf.sty

-- 
2.7.4


