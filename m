Return-Path: <SRS0=xThF=W7=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:to:cc:from
         :subject:content-transfer-encoding;
        bh=8QSs5oubx23i83Dok9oUrHLAjxtIIsjYzA8fR9H5zAQ=;
        b=hU5gBy1HporrAQIAqvJXAKfot0IHpsZqvUuqSFuT/ppdTCW6IlAFIEXa0fahbgzy2y
         SrQBeW4LYYcU4gSay6FVXnvAvD5phwopAxSkQSUBxE+bxaLn6gC1d2w9s7PFJjHupkc6
         ERsAAJI/wGPm2GJCYKAN5l+YzFhTet85yPWEmyIKAZ5jGAPEBX8UE5qinVRmmWoCJ3M+
         xuN7RqjUxLy9eT1pCXJFNRculC7uMcKQnS5d1jgPp8q9l/HOJfkaXvKXrVYzsTFw4JQg
         hOaqI/mOt2KR5D1IJcnJzrmWdJlYm596mI9IFJJl8RSjKSZIPyEQ5eGX4w3eD15TiUFK
         ENWA==
Message-ID: <202dbad7-37db-4d6a-f4d4-6d99180028fc@gmail.com>
Date: Sat, 25 Jun 2022 08:12:09 +0900
MIME-Version: 1.0
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
Subject: =?UTF-8?Q?=5bperfbook=5d_Analogy_of_Figure_7=2e11_Locking_=e2=80=9c?=
 =?UTF-8?B?U2F3IEtlcmbigJ0=?=
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

I find the analogy of Figure 7.11 hard to grasp.

Whether a lock is global or per-instance, the cost of locking
(saw kerf) is observed only when a CPU/thread does the locking
operation.

In this figure, does each board represent data elements, not a
CPU/thread?  If this is the case, what does the waste of "saw kerf"
mean?

What am I missing?

(I hope I am clear enough on what I don't get...)

        Thanks, Akira
