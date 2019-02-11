Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=6es7VEE2HTnOzKGk+OpWLSwGQ19yC1VyjdkmqmhrNQ4=;
        b=LQGM9qNQt8j1H+bhsWxBOqLrGpSdt8zfPkLdDMNxbAypOriNhLbVLyxlY14PIPqmOa
         9JeJcdABIipLQ//q630GqKO1qWUhGEuIqwUFja+avqdf8hTJqlU9ea9r7HSJZeUsde7K
         ngdgrFuZNMDEZKPpZcM+Qu6gpEQPxz3Hs56CzewIAnOJBDzmXWCbbzR1LihC/nRq6NEi
         Sclr2rmXkhfB/psFFRyLgS5RlXei2UVDdz2jJgLo9h8FBqE5p8ddoOpxUopTQfF/LezQ
         qG7DqRkF3EXJtmONUzr/p/c5GzpeTOSKRThi/8qAbU7fpzP+8zhNg7Wsu8E1KphEd6X3
         Wc0g==
Subject: [PATCH 0/3] formal/spinhint: Add result and discussion of 3 readers 3
 updaters QRCU Spin run
References: <db974b96-dd4f-dce2-44a5-1b33f5ed495e@gmail.com>
 <20190202173437.GO4240@linux.ibm.com>
 <d48a0e7f-6869-86ac-6edf-a47c33cdaeb7@gmail.com>
 <20190207091757.GE4240@linux.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <152110af-bf63-2b7b-d48a-52484589de9d@gmail.com>
Date: Tue, 12 Feb 2019 00:08:01 +0900
MIME-Version: 1.0
In-Reply-To: <20190207091757.GE4240@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

This patch set adds the result and discussion you suggested in this
thread.

Instead of replacing the existing table of memory usage (with the
flag "-DCOLLAPSE"), I added another table comparing the memory usage
and runtime obtained with "-DCOLLAPSE" and "-DMA=N".

Patch #1 adds the result as a summary table and give some discussion
of the usage of the compiler flag "-DMA=N". It also adds a quick
quiz comparing the result of "-DCOLLAPSE" and "-DMA=N" with 2 readers
and 3 updaters.

Patch #2 adds a column of search depth in the existing Table 12.2 of
memory usage with "-DCOLLAPSE". This helps the extrapolation of
necessary search depth for 3 readers and 3 updaters. 

Patch #3 is a minor tweak of a footnote in Table 12.2.

It should be possible to reconstruct the story to reference only the
added summary table, but I took another way to minimize the change
of story.  The point is that as long as you have sufficient memory,
there is no need to use "-DMA=N". The search speed can be slower
than that with the flag "-DCOLLAPSE" by nearly one order of magnitude.

Any feedback/update is more than welcome!

        Thanks, Akira
--
Akira Yokosawa (3):
  formal/spinhint: Add result of 3 readers 3 updaters QRCU Spin run
  formal/spinhint: Add column of search depth in Table 12.2
  formal/spinhint: Place footnote inside floating table

 .../formal/promela/atomicincrement.spin.lst        |   2 +-
 CodeSamples/formal/promela/increment.spin.lst      |   2 +-
 CodeSamples/formal/promela/lock.spin.lst           |   2 +-
 CodeSamples/formal/promela/qrcu.spin.33ma.lst      |  37 +++++
 .../formal/promela/qrcu.spin.col-ma.diff.lst       |  48 ++++++
 formal/spinhint.tex                                | 185 ++++++++++++++++++---
 perfbook.tex                                       |   2 +-
 7 files changed, 254 insertions(+), 24 deletions(-)
 create mode 100644 CodeSamples/formal/promela/qrcu.spin.33ma.lst
 create mode 100644 CodeSamples/formal/promela/qrcu.spin.col-ma.diff.lst

-- 
2.7.4


