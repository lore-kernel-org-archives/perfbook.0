Return-Path: <SRS0=h3dM=IH=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=FcoJ9chWQ0y3RgrOxkrhOILT6T8v31/gisE8PfbDLrg=;
        b=GYpdynCOt6hG46QS1z7DgVP53SMIxPdJAnGSJeBCttaPWWsupIFKTbQOuZsFYlVSFi
         eOEi3ZmRKdEVHDUfkOG7Iqob45LYzPkZH2IqtrlcvMDP/RXeGaPjlNwDKGcB89aIDuSD
         KcG31sQ2SUzwErwvmjUTBvxHJpKsZSpq9u51JrKE6WJQqKEDIRvU5Zr61EFp8Jp6JSqg
         YgvmnYMlP034goOwuZvnNzxprWu0BGLwpc8KvaWYnuUgNxw8mQM3BR0p/WEI/2Ih+h0I
         nmCR2Wm4E3zhO7xwNOUy07VI/j3bIhNkPlxjqX412d1j58ZqEkA8Xnn7GcyJdKajRhMA
         bAOQ==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [perfbook] Possible improvements of Figures 9.11 -- 9.13
Message-ID: <25130536-3b28-3cef-30f7-17da90c9ccdb@gmail.com>
Date: Wed, 10 Mar 2021 00:32:30 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

I'm reviewing Section 9.5.
I find Figures 9.11 -- 9.13 are somewhat hard to grasp.

In those figures, P0() is called "RCU Reader" due to the
RCU read-side critical section.

However, it updates x and y, and you are talking about
final values of x and y.

At first glance, it looked as though P0() would read from
x and y, and get values 1 or 2.

Some clarification would help new readers of Edition 2,
I suppose.

        Thanks, Akira
