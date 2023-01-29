Return-Path: <SRS0=bKbQ=52=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xmEn+h580P+DVbrnFaCdGDgkpCiXa3/trFwPqsq//jA=;
        b=WYxjzxUBBTpeubGnow8KqhzdyKLZ6pul26IOBgANLfHZm58Pk46yv0BkBe2f9rEMZa
         CzgjnM6OAqUSQiZObcwbnuKjLXhHXag4cP9R9XxuLO1nUgwjbVw+wKnKr3lzNNxSsi8y
         Il33uVs3Z1qIqaEvw73NHdJbRTkm4InT7aabM0rC+LW4jvSM5JICfrmUOuWdNfV8RPsv
         RJiurSFT8lG74xucKVJTX573IgO/rAbRLrhMATJIfrvqAQL2434tmqBWgqwq9mFfVH4+
         rPCRJ6Ox1JFnkUY1dYn2KNqMQ4ThQTnzAD5bilMyx05/50+Ni6luHJqrf5dGtvgucXE9
         mwqA==
Message-ID: <5b901cbc-f023-4fce-7ed1-7ac48178d169@gmail.com>
Date: Sun, 29 Jan 2023 22:42:24 +0900
MIME-Version: 1.0
From: Akira Yokosawa <akiyks@gmail.com>
Subject: WIP perfbook build scripts improvement
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Snir, Marc" <snir@illinois.edu>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Hi Marc,

Are you still interested in building perfbook on macOS?

I'm now working on improving perfbook's build scripts so that
they can work on BSD-like systems such as FreeBSD.

It turns out that there are a couple of commands whose non-GNU
implementations may not suffice for building perfbook.

  - sed: Need multi-line editing support (N/A in FreeBSD sed).
    
  - grep: Need -z option (N/A in Busybox grep on alpine, may
    depend on version/config).

  - date: Need GNU style options. (Incompatible with BSD ones)

  (This is by no means complete.)

Among them, the most probable cause of the error you encountered
last June is the "date" command in utilities/autodate.sh.
It assumes GNU date. The generated autodate.tex you provided at
the time indicates you have "date" from BSD.

I have updated autodate.sh so that both GNU and BSD variants of
date can be used.

Also, there are several "{"s in egrep patterns which are invalid
in non-GNU grep.

I have made them portable by saying "[}]" instead.

A WIP branch is available at:

    https://github.com/akiyks/perfbook/tree/WIP-portable-build

I'd be delighted if you could give it a try on a macOS system.
Running "make" (or "gmake" if that is the name of GNUmake) on the
branch will complain about incapable command(s).
Running "make precheck" will do the test without building perfbook.

Sometimes, you need to keep BSD and GNU variants with different names.

For example, on FreeBSD, GNU sed is provided as a package named "gsed"
with the command name of "gsed".

Such alternative names can be provided via make variables as well as
environment variables, such as "make SED=gsed", "make DATE=gdate",
"export SED=gsed; make", "export DATE=gdate; make", and so on.
There is no such knob for the grep command at the moment. In case macOS
needs it, I can easily add it.

Documentation on this portability improvement is not yet available in
the WIP branch.  I'm hoping I can add it shortly based on this email
message.

Looking forward to hearing from you.

        Thanks, Akira


