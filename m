Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=eM6TOmBkrYHPpde/btP0tt4tOoQUR2RQeHHuCezrz7k=;
        b=LLl+BrfGgsuOCcMEhxo0flu6YA9Vs/8g34Yoe0N98dzc8rRVBpKLwhngP9Bf9mianA
         AWeg+G1Amu4i4WvYljTaeWWVetwYhfmJZO6OnbnEphgvkkX7k7a5hLUWcyjV8SqYU3xf
         h0mRLNji42vpQVaQg6wLYvZiTLpY8JYMuzj1Jt5JG5Z7ZillZjVo/iAqhadlLSB20MEG
         s8NQNLKD7xh/0q4tsalI7xssLPTl94kZKhWOp27d5qECosKiIpyrPQ/tN9BIxQPdyqPY
         3Ac5qcGl8xeF/p8G8P6WVup5g30ba5tUBSFYqyVtQ/GxEwRHAWIOj+KpATEph3q6zQjx
         J7Jg==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [Possible BUG] count_lim_atomic.c fails on POWER8
Message-ID: <d6abdc9c-9d0e-9435-05be-85a4fe9d3347@gmail.com>
Date: Sun, 21 Oct 2018 00:53:17 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

I just noticed occasional error of count_lim_atomic.c on POWER8 at current master.
As I've recently touched the code under Codesamples/count/, I also tested on
the tag "v2017.11.22a", and saw the same behavior.

The POWER8 virtual machine is Ubuntu 16.04.

Example output:

$ ./count_lim_atomic 6 uperf 1
!!! Count mismatch: 0 counted vs. 8 final value
n_reads: 0  n_updates: 26038000  nreaders: 0  nupdaters: 6 duration: 240
ns/read: nan  ns/update: 55.3038

$ ./count_lim_atomic 6 perf 1
!!! Count mismatch: 0 counted vs. 11 final value
n_reads: 287000  n_updates: 1702000  nreaders: 6  nupdaters: 1 duration: 240
ns/read: 5017.42  ns/update: 141.011

As you see, the final count check of zero fails even when nupdaters == 1.

I have no idea what's wrong in count_lim_atomic.c.

Can you look into this? There might be something wrong in the header file
under CodeSamples/arch-ppc64.h.

On x86_64, I've never seen the count mismatch.

         Thanks, Akira
 

