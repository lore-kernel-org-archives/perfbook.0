Return-Path: <SRS0=gDlb=Z5=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=zBDk8kjcuT+hKNH5AeC+gZmwxG1l+EwOkvZ75kCmIUc=;
        b=ZI5gTkOchfhPBEmUi5FldFhJOlNpZ12P5I5ZZJh6/pNjKMw1BBdxCC48U0W6p6AcAE
         Adokl5ChImjTiGjZX6iHWZjbYDe9vn2nly9808caneuLUlMiQrMSSE12ZE+f8U+y2kX1
         KDWvtXHQ/uC37DlIEZs2htGBU84hByPzVPVu7A1KmZ8ptjSDMbMUCyJ+Ed3eWcM/Sew5
         T66cBZGlXfWz8DI51qdE0s01VxyJzoxholO1jTcjOLGdE829cjOxiRMx789ZQsEGPtDh
         /EqsK/8gvHHTKcLIiflT+KAiQ66uhD3L9VA84U3cB7Fi7J/QgXxAo2V39kOlAMlNWv+l
         Vk4Q==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 0/2] Minor updates
Message-ID: <eb5c3f76-c84f-c801-ceb4-27efd64e2d0f@gmail.com>
Date: Sat, 7 Dec 2019 13:05:17 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>, perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

This patch set fixes minor issues I noticed while reading your
recent updates.

Apart from the changes, I'd like you to mention in the answer to
Quick Quiz 9.43 that modern Intel CPUs don't execute x86_64
instructions directly, but decode them into uOPs (via MOP) and
keep them in a uOP cache [1].
So the execution cycle is not necessarily corresponds to instruction
count, but heavily depends on the behavior of the microarch, which
is not predictable without actually running the code. 

[1]: https://en.wikichip.org/wiki/intel/microarchitectures/skylake_(server)

        Thanks, Akira
--
Akira Yokosawa (2):
  toyrcu: Use mathcal O for 'orders of'
  defer/rcuusage: Fix typo (that -> than)

 appendix/toyrcu/toyrcu.tex | 2 +-
 defer/rcuusage.tex         | 2 +-
 perfbook.tex               | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.17.1

