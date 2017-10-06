Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mail-wm0-f48.google.com ([74.125.82.48]:47838 "EHLO
 mail-wm0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1750732AbdJFFwf (ORCPT <rfc822;perfbook@vger.kernel.org>); Fri, 6
 Oct 2017 01:52:35 -0400
Received: by mail-wm0-f48.google.com with SMTP id t69so5468377wmt.2 for
 <perfbook@vger.kernel.org>; Thu, 05 Oct 2017 22:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=mime-version:from:date:message-id:subject:to;
 bh=+AejBNZJHQYwh3S1sPyWDddEAbFLW8d0wcTHtsgNo6o=;
 b=QtI8ey/e4iHOSldMKoP8etZxXNY3Tq3QglkgBCJ7ViCQNk8xVAWdoC3LmXsQVXcWCR
 QBtCSF2hR+xqhPV+2W5MSDgueEFexWuhXYTIKyTd6w6IFKrRvGRHQY6Lu2sIULf2Vlm6
 SlZVJLqCqeZjbGFjSmwvo4D+lf97fvLee6SoLl22Fvqva6vqFZ974cm0mDKrO/DZP2Px
 Qyg9IGgbyj2XLhEz4tHzNQnCfrLTqcMJXBLHtBnPKBT1YKVHZkmjXvwOXjJkoWoQ3Ory
 YuQNT6X8G4X0zq5kBtE20rBf45RnqEn2188wGN6DwfBQ48PsvVcQcgQl/IwqdzpU54aC
 LqjA==
MIME-Version: 1.0
From: Yubin Ruan <ablacktshirt@gmail.com>
Date: Fri, 6 Oct 2017 13:52:33 +0800
Message-ID: 
 <CAJYFCiMix3XfQ0Z=BMUO39eNssYcVLR-Y1zHee+QT9cBsVS3KA@mail.gmail.com>
Subject: synchronize with a non-atomic flag
Content-Type: text/plain; charset="UTF-8"
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org

Hi,
I saw lots of discussions on the web about possible race when doing
synchronization between multiple threads/processes with lock or atomic
operations[1][2]. From my point of view most them are over-worrying.
But I want to point out some particular issue here to see whether
anyone have anything to say.

Imagine two processes communicate using only a uint32_t variable in
shared memory, like this:

    // uint32_t variable in shared memory
    uint32_t flag = 0;

    //process 1
    while(1) {
        if(READ_ONCE(flag) == 0) {
            do_something();
            WRITE_ONCE(flag, 1); // let another process to run
        } else {
            continue;
        }
    }

    //process 2
    while(1) {
        if(READ_ONCE(flag) == 1) {
            printf("process 2 running...\n");
            WRITE_ONCE(flag, 0); // let another process to run
        } else {
            continue;
        }
    }

On X86 or X64, I expect this code to run correctly, that is, I will
got the two `printf' to printf one after one. That is because:

    1) on X86/X64, load/store on 32-bits variable are atomic
    2) I use READ_ONCE/WRITE_ONCE to prevent possibly harmful compiler
optimization on `flag'.
    3) I use only one variable to communicate between two processes,
so there is no need for any kind of barrier.

Does anyone have any objection at that?

I know using a lock or atomic operation will save me a lot of
argument, but I think those things are unnecessary at this
circumstance, and it matter where performance matter, so I am picky
here...

Yubin

[1]: https://software.intel.com/en-us/blogs/2013/01/06/benign-data-races-what-could-possibly-go-wrong
[2]: https://www.usenix.org/conference/osdi10/ad-hoc-synchronization-considered-harmful
