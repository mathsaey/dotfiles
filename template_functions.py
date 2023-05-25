import subprocess
import json

def bwGet(field, object):
    res = subprocess.run(
        ["bw", "--nointeraction", "get", field, object],
        capture_output=True
    )

    if res.returncode == 0:
        return res.stdout.decode('ascii')
    else:
        print("Something went wrong when calling bw get {} {}:".format(field, object))
        print(res.stderr.decode('ascii'))
        return ""

def bwGetField(field, object):
    res = bwGet("item", object)
    if res:
        for dct in json.loads(res)['fields']:
            if dct['name'] == field:
                return dct['value']
        print("Could not find field {}".format(field))
        return ""
    else:
        return ""
