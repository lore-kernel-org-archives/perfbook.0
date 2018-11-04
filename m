Return-Path: <junchangwang@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=from:to:cc:subject:date:message-id;
 bh=X1Wz25/QU18gbQcYkNUAEWm4PbbIXhV7Tzox7LBoUm0=;
 b=XHr6m5OT/txLpLrv+0vwt4yDnvkZnlWui+sCZgWqFVypLbqA4/3i3DLWBegWxabJUP
 giKUXEm48ssy/Fgv0yKfx/ABg64zCJ1l0fPbhaaP1dbGw6ngsbc6TO3mqHd+MUa5R0B7
 +Z+zz9fhFgFVJuxVy7EhtbK7srX1nYEU0XsIspEppWgxwyerkSzO2bV761MjjlKGcpi/
 XIMzcTkYmo5WLgIWC6HTA4aoabh1OgSYkVUxUYGOpShjxm3NlTE62IDimTqVsrJL+GIm
 IglJ6wdj8Mq/3UfJIBeFcDiaiYijLXtUAW0891jPry72P4eQm8EIb2TTpYfvIn8DolDr
 pSKQ==
From: Junchang Wang <junchangwang@gmail.com>
Subject: [PATCH 0/2] Updates to Chapter memorder
Date: Sun,  4 Nov 2018 19:18:37 +0800
Message-Id: <1541330319-14491-1-git-send-email-junchangwang@gmail.com>
To: paulmck@linux.vnet.ibm.com, akiyks@gmail.com
Cc: perfbook@vger.kernel.org, Junchang Wang <junchangwang@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul and Akira,

I have read through the first half of Chapter memorder, and here is correction
for a few typos. Please take a look.

For the first patch, the last clause I modified still looks confusion to me.
Currently the clause is "though only if both \co{r1} and \co{r3} both end up
containing the address of \co{x}"; however, my understanding is that prior load
or store would also be ordered before the store on line 16, __only if r1 ends up
containing the address of x__. That is, it is not necessary to involve r2/r3. Is
my understanding correct? Or did I miss anything about this in the book?


Thanks,
--Junchang

Junchang Wang (2):
  memorder: fix typo
  memorybarriercum.svg: fix typo

 memorder/memorder.tex         | 8 ++++----
 memorder/memorybarriercum.svg | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

-- 
2.7.4

