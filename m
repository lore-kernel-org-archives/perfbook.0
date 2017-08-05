Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=to:cc:references:from:subject:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZBNG9d9wu3iZjZmsm6YyX9f6fRX+85hEI5SzphMV+/U=;
 b=Mnp3QQbk8pN+1dqbTm6Zik119QAzES6dfiCchsuWGFZUxDs0kxyI0Eqv1ivzG1z/lq
 ZsGYQsSsZyarSKioLjm19Zb9F22DDbuP0utqkRia/gWjSXS2tGOiLc65HTIzFyWYA2gy
 shF4uSLuCuUOQvjpa9iWvyaz5hB31KrwTz+KkYAU0jkFZlW8N8cyN711IbKbxksGWCXS
 irCRaTDNJ4iW3liv1FryuMRX/Hx5n+y8v1h/kHecKpRRXnJSaolR8R/zFMbLALU4h3OP
 Df0yCAugJDf+xg9aNvyPQJpefqKhWff3+aZ5JdoxUoADiBaz9uLV8nxIHzstHjJJwTaz
 dOsQ==
References: <26a47dec-a9a0-87e6-88c8-b9ba82c477d5@gmail.com>
 <11d41e53-5367-1149-8064-8808696a2c33@gmail.com>
 <20170801204047.GH3730@linux.vnet.ibm.com>
 <068877e2-655b-0d6f-6dab-84d11467d0e5@gmail.com>
 <20170802162910.GY3730@linux.vnet.ibm.com>
 <0a7b7a93-c60c-436f-77a7-e2b27de86a40@gmail.com>
 <20170802224820.GH3730@linux.vnet.ibm.com>
 <672edb74-85b9-1086-44ee-dba21a0589c9@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 0/3] Employ auto-numbering in litmus tests
Message-ID: <94dbb98d-370a-8311-b467-9670f3968393@gmail.com>
Date: Sat, 5 Aug 2017 12:41:30 +0900
MIME-Version: 1.0
In-Reply-To: <672edb74-85b9-1086-44ee-dba21a0589c9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From ba0af5ad755ab4e175b07abb71890077e4d54a20 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 5 Aug 2017 12:29:10 +0900
Subject: [PATCH 0/3] Employ auto-numbering in litmus tests

Hi Paul,

As I mentioned earlier, we need to revert commits related to floatrow.
Patch #1 does the revert.
Patch #2 converts litmus tests in Memory Barriers section to use
auto-numbering.
Patch #3 updates style guide to reflect the removal of floatrow and
a typo fix. 

I'm considering "subfig" package as an alternative to floatrow.
It predates floatrow and has less capability.
I'll see if it works in two-column layout, and update the style guide
if it goes well.

      Thanks, Akira 

Akira Yokosawa (3):
  Revert commits after "Localize floatrow.sty as floatrowpf.sty"
  advsync: Employ auto-numbering in litmus tests
  styleguide: Remove references to 'floatrow' and adjust context

 advsync/memorybarriers.tex         |  502 ++++++------
 appendix/styleguide/hello.c        |    9 -
 appendix/styleguide/styleguide.tex |  205 +----
 defer/rcuusage.tex                 |    6 +-
 floatrowpf.sty                     | 1482 ------------------------------------
 howto/howto.tex                    |    4 +-
 perfbook.tex                       |    4 +-
 7 files changed, 280 insertions(+), 1932 deletions(-)
 delete mode 100644 appendix/styleguide/hello.c
 delete mode 100644 floatrowpf.sty

-- 
2.7.4


