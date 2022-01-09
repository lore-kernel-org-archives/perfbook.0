Return-Path: <SRS0=KFAY=RZ=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:subject:to:cc:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=gey9xy814qdWDpD+dLcG3ij9s+svWntov3q4ZCMzb3c=;
        b=JuEwj63jB+MPIGZKCwE0+tIzZjOmdSglK8HXsJ3ZppElvvj+XP7r8ISn/S2Ua3+Tsu
         LYRRP5YH+WqH3oObI+VniV0h92CGBFz+5vFbHZKiKUBU91QlSAn5t0LvPTckUrt4ZYD1
         osobyEQCA0xOKF8qdC8SypK8deRiH9DZdwoj+lc2GwKsLZ4I7IjFqN6c7odM4X7uQQkY
         1hBsKgDSFTZuOOoeG6+S6TKg42y3v/C486b8AkVY4d33cbkxxhn6yCWqf3QdD3nbryGa
         SgdUoPX+Phhit3MpXUZ/UbIaJFMS9xNoRLsc6ghzkV5+5x8XJogPdh3fSkKVpl7hp3r9
         gCYw==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: A few comments on new Section 9.5.1.2 "Core RCU API"
Message-ID: <76a0b4f0-6e9b-8012-edc4-e3f6ea918659@gmail.com>
Date: Sun, 9 Jan 2022 10:35:28 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

Here are a few comments occurred to me while reading Section
9.5.1.2.

o Section title reads "Core RCU API", whereas Table 9.1's
  caption reads "RCU Core API".  They look somewhat
  inconsistent.  Is the difference intentional?

o In the introduction of rcu_dereference(), the term of
  "an RCU-protected pointer" is used first time throughout
  this book.  It is also used in the new Table 9.1.

  I think it is pretty obvious for you what it means, but a
  first-time reader might wonder, "What does protecting a
  pointer mean?"

  A short answer would be something like:

    What is protected by an RCU read-side critical section is
    not the pointer itself, but an instance of a pointed-to
    data structure on memory.

  You can expand as you'd like.

Thoughts?

        Thanks, Akira


