Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mail-it0-f52.google.com ([209.85.214.52]:55086 "EHLO
 mail-it0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1726043AbeGNNSu (ORCPT <rfc822;perfbook@vger.kernel.org>); Sat, 14
 Jul 2018 09:18:50 -0400
Received: by mail-it0-f52.google.com with SMTP id s7-v6so14902037itb.4 for
 <perfbook@vger.kernel.org>; Sat, 14 Jul 2018 05:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=mime-version:from:date:message-id:subject:to;
 bh=OTuezg1s2R2jyu1/kKGvuOyydJZEAkJuHoMavBUbUaQ=;
 b=RGH2PJvBrsXUPoorAwQMXSN7Z6p/glxwCoCUTKTzZ59ntZgISk1+qbh4BpTM/eZYx8
 hZfsRHS9Rla0t+DfCM3CSXtqjH0ePFkAaz9NNJ2LztFlMI+jZ7ZJ+9gVwBQ3L5VFPVOi
 HdqKWsqSEElC8ldsRpv+tfg5lSNtrWIRvkNpGb4YOYvq/ZJQZRx3d4MirbLsGALC4Qr9
 qL5MfLXoxUjpt2oa6qjaZEXto7MiWMb7PFhoB02OUGBgfpV1BqD6iw914Azt1QLz5ZR3
 5JUdEnMQaaOLXQc6XjMiLuOXpK5EI5N33ckbf1aNyQLwGOgk2ukSoYY5P0Z4gz2yazTx
 ar+Q==
MIME-Version: 1.0
From: Elad Lahav <e2lahav@gmail.com>
Date: Sat, 14 Jul 2018 08:59:48 -0400
Message-ID: 
 <CAJbg=FVjq_rwhvSw3Y=7xOxUqN_kV4P=wD42HU9=1u3KGnyJpg@mail.gmail.com>
Subject: Section 4.2: wrong error reporting for pthread functions
Content-Type: text/plain; charset="UTF-8"
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org

Hello,

Throughout section 4.2 the following pattern is used for reporting
errors returned by various pthread functions:

if (pthread_func() == 0) {
    perror("pthread_func");
    exit(-1);
}

This is wrong, as pthread functions return the error number on failure
and do not set errno, as demonstrated by the following program, which
attempts to join with a detached thread:

#include <stdio.h>
#include <errno.h>
#include <pthread.h>

static void *
my_thread(void *arg)
{
    return NULL;
}

int
main()
{
    pthread_attr_t  attr;
    pthread_t       tid;

    pthread_attr_init(&attr);
    pthread_attr_setdetachstate(&attr, PTHREAD_CREATE_DETACHED);

    errno = 0;

    if (pthread_create(&tid, &attr, my_thread, NULL) != 0) {
        perror("pthread_create");
        return 1;
    }

    if (pthread_join(tid, NULL) != 0) {
        perror("pthread_join");
        return 1;
    }

    return 0;
}

The result:
# ./pthread_error
pthread_join: Success

The correct way to report errors is to use strerror() on the returned code:

#include <string.h>
...
    int rc;
    rc = pthread_join(tid, NULL);
    if (rc != 0) {
        fprintf(stderr, "pthread_join: %s\n", strerror(rc));
        return 1;
    }

# ./pthread_error
pthread_join: Invalid argument

Also, using exit(-1) is likely to produce unexpected results for the
parent process. Error codes returned from processes are small
integers, with the range being platform-specific. This means that -1
will get truncated to some unspecified value. It is customary to use 1
to indicate a failure from a process (if no other specific code is
defined). stdlib.h provides EXIT_SUCCESS and EXIT_FAILURE, which may
be easier to read.

--Elad
