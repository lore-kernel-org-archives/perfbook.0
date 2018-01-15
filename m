Return-Path: <ablacktshirt@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent;        bh=J7l2mYkzWdAkNZoU3L3+B+19JIpCfqii2qtSh193AGw=;
 b=agxMbQqf8VfQUnBPFqYIgJQncp7A3eqq4cEFEz8StrCRoXEipQnttVC0i9ONbzG8nz
 2jxj6pvv7bQsSBYTeGQoYcjv/Hw8m+NHPlz7nWk/ebQc4pkj6LD8MLhQBc81qqIzsJZ2
 SiJPtfAx0q3+BylCkTpawIAigBC8j/zpfagrNfhsB9rppaltnYTupRQWwhCuaU7z82Vu
 +IvO4N8oNRwz4NB+jYCi+4zjbhEoYqbNUKn+k5+EvtCXyuFRG6i3tjigFIx2O37eaHWr
 3PHA5x6qhvG4FhhC1toZVAqqHxY325vcV3ZfI9jv+oTz0KoKz+KLoEciVVglojn3oiPO
 aqog==
Date: Mon, 15 Jan 2018 22:28:33 +0800
From: Yubin Ruan <ablacktshirt@gmail.com>
Subject: STM implementation
Message-ID: <20180115142809.GA28308@HP>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

I writing to ask about implementation of STM (software transactional memory).

I just finish section 17 of the perfbook, but that doesn't say much about
implementations of transactional memory, especially STM. Basically I
understand the common implementation of HTM (hardware transactional memory)
and have experience using it (thanks to the meltdown paper[1] and the original
HTM paper[2] and some other materials[3]). But I cannot find useful materials
on the topic of STM implementation. I read through the original STM paper[4],
but found it a bit cryptographic (hard to understand). Based on the materials
I read so far, STM can be implemented using lock-free algorithms or simply
locking. Alternatively, it can also be implemented using techniques similar to
those in the database world (write-ahead logging, i.e., journaling). But I
guess a robust and efficient implementation will require more to handle issues
such as I/O ? Can you provide some hints on this topic?

I am still investigating and will really appreciate any comments.

        Yubin

[1]: https://meltdownattack.com/meltdown.pdf
    (The meltdown paper)

[2]: http://cs.brown.edu/~mph/HerlihyM93/herlihy93transactional.pdf
    (Transactional Memory: Architectural Support for Lock-Free Data Structures)

[3]: https://www.scss.tcd.ie/~jones/CS4021/transactional%20memory.pdf
    (A lecture note on Intel TSX, which also talk about implementation of HTM)

[4]: https://pdfs.semanticscholar.org/846e/87f6c8b9d8909d678b5c668cfe46cf40a348.pdf
    (Software Transactional Memory)

