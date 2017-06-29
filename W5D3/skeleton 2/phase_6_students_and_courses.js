function Student(first, last){
    this.first = first;
    this.last = last;
    this.course = [];
}

Student.prototype.name = function(){
    reuturn `${this.first}${this.last}`
};

const std1 = new Student("Emily", "Watson")

Student.prototype.enroll = function(course){
    if (!this.course.includes(course)){
    this.course.push(course);
    course.addStudent(this);
    return this.course; 
    }
};

Student.prototype.courseload = function() {
    let hash = new Object();
    this.course.forEach (
        el => hash[el.dept] = el.credits
    );
    return hash;
};

function Course(name, dept, credits){
    this.name = name;
    this.dept = dept;
    this.credits = credits;
    this.students = [];
}

Course.prototype.addStudent= function(student){
    if (student.course.includes(this)){
    this.students.push(student);
    student.enroll(this);
    return this.students;
    }
};

course1 = new Course("Mathematical thinking","Math",10 );
course2 = new Course("Fabric","Arts",30 );
std1.enroll(course1);
std1.enroll(course1);
std1.enroll(course2);