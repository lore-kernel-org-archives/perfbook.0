Return-Path: <SRS0=7RMV=FG=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695390752; x=1695995552; darn=kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2BO62Rk4n2W4jdWsBTaUrh5O1yHeYW9Zn1fs8Dp3nf4=;
        b=JQYKRR6FD0PbuxcSkLL2BYavLQ18d74hqEdRcIVYV8jY5FAA7OeHULBKD/OENNCCjD
         ipmpNxaPbvmPdTubVqHMrXrvUewwXKt8VZ3d30EUR9Cy3sCyFZeg3eHrJC2lmGjb5ABP
         KLIcJvdAjCl8CvqxzN7YxF/Y7PODTF2kpwgQlj9/Ms1r29uKT4O8QxA6+K0tlguX4tzB
         /fpv9oP1y+YzwT84ZkoznixW7CKTNUVfARP5Zm7il5nOBNjwhvpLDM6uNrYhAL+Rhe32
         Lgb9Q2QWQ3URAS0P3f1LlxMfH762GqX+ao3fNxBLGGy3CHAjWlCNSTH3w9YtqyOYksCj
         84ug==
Message-ID: <f16891e8-6d60-327a-0d2d-4bb3cb04899e@gmail.com>
Date: Fri, 22 Sep 2023 22:52:28 +0900
MIME-Version: 1.0
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook 0/4] memorder: Add index markers
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

Somehow, "address dependency", "control dependency", and "data
dependency" are missing in Index.

Let's add them.

Having them in glossaries might be a good idea.

Patch 4/4 fixes an issue in flat form index where the words in
the text are used as index entries marked with \IXalth{}{}{}.

        Thanks, Akira
--
Akira Yokosawa (4):
  memorder: Add index markers for 'address/control/data dependency',
    take 1
  memorder: Add index markers for 'address/control/data dependency',
    take 2
  memorder: Add index marker for smp_read_barrier_depends() as classic
    API
  Fix definition of \indexh for flat index pages

 indexsee.tex          |  3 +++
 memorder/memorder.tex | 19 +++++++++++--------
 perfbook-lt.tex       |  2 +-
 3 files changed, 15 insertions(+), 9 deletions(-)


base-commit: 1bb7254318e196c808d3620c230707d989eb536e
-- 
2.25.1

