Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=6vmB5bcwtkSkTLG16RTeOXFOa47wu2Jp4PlsOgR93vQ=;
        b=BEv6NNCni0aJ6LzXQv608l9cQCnxAkwpHPpP/CZdPUu8nF4zhBhSf1/O2wAXXQAfzX
         U86WqEqOkEGaT2ZKhmTxYWyPstWkew59Cxu3hGs+fE41F8xfRLDI/S0gb2z8iMOgy1XZ
         W0bRey1AIBr4x8lcxXrBdlTIEfgq0ZACan96azGVvyYMCfGpbCpK2znhpAXFEtPxfxne
         Lo+UsMUJbXvY6ELjyQrOgIUjPqNeaTkPo9r6J0Tu0b8goHiEqJBxii3EsCy9GQsR2VVp
         /Z36lFK4kWH5XFODHHmCbGglHW3sZCzfGq42M3O366GVa5sdW0amd4lMDpwPxuGVb2q1
         M5HQ==
Subject: Re: [PATCH 1/3] formal/spinhint: Add result of 3 readers 3 updaters
 QRCU Spin run
References: <db974b96-dd4f-dce2-44a5-1b33f5ed495e@gmail.com>
 <20190202173437.GO4240@linux.ibm.com>
 <d48a0e7f-6869-86ac-6edf-a47c33cdaeb7@gmail.com>
 <20190207091757.GE4240@linux.ibm.com>
 <152110af-bf63-2b7b-d48a-52484589de9d@gmail.com>
 <a83e948f-d241-be30-733b-87975452fd1a@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <c5ee9c83-e89a-c3d2-e293-21396acb7db8@gmail.com>
Date: Tue, 12 Feb 2019 00:28:12 +0900
MIME-Version: 1.0
In-Reply-To: <a83e948f-d241-be30-733b-87975452fd1a@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Paul,

There was a typo in the commit log.

On 2019/02/12 00:11:23 +0900, Akira Yokosawa wrote:
> From fe701731c7296b90deae52747f5f3be556511289 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Sun, 10 Feb 2019 00:02:26 +0900
> Subject: [PATCH 1/3] formal/spinhint: Add result of 3 readers 3 updaters QRCU Spin run
> 
> By using the compiler flag "-DMA=N", run of qrcu.spin with 3 readers
> and 3 updaters can be completed with the memory usage of 6.5GHz.

                                                              ^^^^
                                                           6.5GB.

Can you amend it for me?

        Thanks, Akira

> 
> This commit adds the result and the command used to run the
> verification. A Quick Quiz is added to present an indirect
> evidence of search completeness.
> 
> As the compiler flag "-DCOLLAPSE" generates much faster code,
> memory usage table with "-DCOLLAPSE" is kept. The complete
> table for the runs with the flag "-DMA=N" is added as another
> table.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
>  .../formal/promela/atomicincrement.spin.lst        |   2 +-
>  CodeSamples/formal/promela/increment.spin.lst      |   2 +-
>  CodeSamples/formal/promela/lock.spin.lst           |   2 +-
>  CodeSamples/formal/promela/qrcu.spin.33ma.lst      |  37 +++++
>  .../formal/promela/qrcu.spin.col-ma.diff.lst       |  48 +++++++
>  formal/spinhint.tex                                | 150 ++++++++++++++++++++-
>  6 files changed, 234 insertions(+), 7 deletions(-)
>  create mode 100644 CodeSamples/formal/promela/qrcu.spin.33ma.lst
>  create mode 100644 CodeSamples/formal/promela/qrcu.spin.col-ma.diff.lst
> 
[...]

