Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=Vl4Hr5jcHdLIk55+KrVGqufkpe/hfiOpXUdviiXqOgo=;
 b=c4opiJJ7h3etLwdboV5o+XXATVELbBJVjhyGOiGjCKMStahmrlrr+ZhvGtlKwpHnR6
 4T6zUiXp4t05enBNEpw5kC+ZoUQeYRjXQ2q95RymfgTvMfRbamwQKmk1OTiSrFeuOOOL
 g6UXnuDmC90x98J7aIcNdAe4WQVNq10iHTzBmFU2r0uI/Em3cJ6MW2Sq3ZbSwbkQPOtJ
 4kzYhLJ3cWoU7WkEiY94gOvDWOUaGdN07+mToEaGqYLi5SYYLaIr46eY+CDMnVJHvxZi
 JiH1GkBQCx4rnIRIxviCgfKpR4apAWhKYVlSR5YxBCzTgi73zbY136WBGwi/nnlXv/7B
 +TtA==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: Other-multicopy atomicity
Message-ID: <a5f7959b-cfe3-9bc3-3f65-7b1f9577ad99@gmail.com>
Date: Sat, 2 Sep 2017 13:09:37 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

I have a comment on the term "other-multicompy atomicity".

It took a while for me to realize that the "other-" stands for "other than self CPU".
At first, it sounded like "other type of multicompy atomicity", which looked
quite vague.

Commit 43236beadb1 ("memorder: Expand on cumulativity and {other,} multicopy
atomicity") helped me to realize your intention. May I suggest to add a footnote
on the use of "other-"?

Also, you failed to replace tabs to white spaces in listing added in the
above mentioned commit.

       Thanks, Akira

