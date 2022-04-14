Return-Path: <SRS0=+I7C=UY=gmail.com=haolee.swjtu@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :content-transfer-encoding:user-agent;
        bh=0tDwsIgD8rynyLluHMfqN3o98ksNpiZzqkeHIB9i6DQ=;
        b=O2BsUNL3xc8H03gymaeWX2VDv11xjVkvsDZdN3fTi03+fc6Tfh8toZM958LSVM3c1i
         cPmvsCKCA+Z8Zntmf9MBqoKNQlCbTtW4JwatMXZUxXuIkCnVHkpQmQ+HidKlh+AceFnt
         UQrdsZYptK2XcOWUsM/EqoMvkPKxkHQ5927wnIZOwj/0ydKiYLt+3ZH9OIsfZ5lv+y8n
         hi8920Si1EikQEZEUXRAGHNF9enN6/6MpsbB17h9FePuDSQJQxJSdQVWHTBurNAsi0CZ
         TMj+zW/gg0SnWKTcViw2xezgIpJyPYdcy2HqjLSwbf3/Bmo3pQFLn1lFvBPhL7qBSVo+
         6nxQ==
Date: Thu, 14 Apr 2022 17:42:25 +0000
From: Hao Lee <haolee.swjtu@gmail.com>
Subject: The answer of Quiz C.8 is not quite reasonable
Message-ID: <20220414174225.GA29861@haolee.io>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Hi,

At the beginning of C.3.3 we have supposed the cache line containing "a"
resides _only_ in _CPU1’s_ cache. I think this is why _CPU0_ has to send
a "_read_ invalidate message" to _retrieve_ the cache line and invalid
CPU1's cache line.

However, the answer says the reason is the cache line in question
contains more than just the variable a. I can't understand the logical
relationship between this answer and the question. Am I missing
something here? Thanks.

Regards,
Hao Lee
